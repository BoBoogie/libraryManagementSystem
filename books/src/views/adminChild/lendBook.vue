<template>
  <div class="lendBook">
    <main-top-bar classify="图书借阅"></main-top-bar>
    <div class="search">
      <div class="studentEnter">
        <el-input v-model="account" placeholder="请识别学生卡或输入学号" @blur="getStudentInfo"
                  @focus="clearStudentInfo"></el-input>
      </div>
      <div class="booksEnter">
        <el-input v-model="bookid" placeholder="请输入图书编号或扫描条形码进行借阅" ref="bookid"
                  @keyup.native="checkEnter"></el-input>
        <el-button type="primary" @click="submitLend">确认借阅</el-button>
      </div>
    </div>
    <div class="studnetInfo">
      <div class="topbar"> 学生信息</div>
      <div class="infoContent">
        <div id="name">姓名：{{ studentInfo.studentname }}</div>
        <div id="account">学号:{{ studentInfo.account }}</div>
        <div id="class">班级：{{ studentInfo.class }}</div>
        <div class="noReturn">总借阅量：{{ studentInfo.lendbook | lendBooks(studentInfo.account) }}</div>
        <div id="status">状态：{{ studentInfo.status | userStatus }}</div>
      </div>
    </div>
    <div class="title">图书信息</div>
    <div class="lendBooks">
      <book-exhibit :booksInfo="booksInfo">
        <div class="sucess">借阅成功</div>
      </book-exhibit>
    </div>
  </div>

</template>

<script>
import mainTopBar from '../../components/common/mainTopBar.vue';
import bookExhibit from '../../components/content/bookExhibit.vue'

export default {
  name: 'lendBook',
  components: {
    mainTopBar,
    bookExhibit
  },
  data() {
    return {
      account: '',
      bookid: '',
      studentInfo: {},
      booksInfo: [],
    }
  },
  methods: {
    getStudentInfo() {
      this.$axios.get('/admin/getstudentinfo', { params: { account: this.account } })
          .then(res => {
            this.studentInfo = res.data.data;
            console.log(this.studentInfo)
          })
          .catch(err => console.log(err))
    },
    submitLend() {
      if (this.studentInfo.account == undefined) return alert('暂无学生信息');
      if (this.studentInfo.status !== 0) return alert('该用户状态异常');
      let bookFormat = /^\S{1,8}-\d{1,5}/;
      if ( !bookFormat.test(this.bookid)) return alert('图书编号需为XX-XX');
      this.$axios.get('/admin/lendbooks', { params: { userid: this.studentInfo.id, bookid: this.bookid } })
          .then(res => {
            this.booksInfo.unshift(res.data.data);
            this.getStudentInfo()
          })
          .catch(err => console.log(err))
      this.bookid = '';
      this.$refs.bookid.focus();

    },
    clearStudentInfo() {
      this.account = '';
      this.studentInfo = {};
      this.booksInfo = []
    },
    checkEnter() {
      if (event.keyCode == 13) this.submitLend();
    }

  },
  filters: {
    userStatus(status) {
      if (status === undefined) return '';
      return status === 0 ? '正常' : '状态异常';
    },
    // 判断借阅数量
    lendBooks(booksid, account) {
      if (booksid == null && account == null) {
        return '';
      } else if (booksid === null && account !== null) {
        return 0;
      } else {
        let a = booksid.split(',');
        return a.length
      }

    }
  }


}
</script>

<style scoped>
.search {
  display: flex;
  justify-content: space-around;
}

.studentEnter,
.booksEnter {
  flex: 1;
  display: flex;
}

.studnetInfo {
  text-align: center;
  margin-top: 20px;
  width: 100%;
  padding-bottom: 10px;
  border-bottom: 3px solid #fff;
  font-family: "微软雅黑 Light";
}

.topbar {
  font-size: 20px;
  margin-bottom: 20px;
  font-weight: 600;
}

.title {
  margin-top: 10px;
  height: 40px;
  line-height: 40px;
  text-align: center;
  font-size: 20px;
  font-family: "微软雅黑 Light";
  background: linear-gradient(to left, rgba(0, 114, 255, 0.6), rgba(0, 198, 255, 0.6));
  text-shadow: 0 10px 10px rgb(10, 77, 165);
  color: #fff;
}

.lendBooks {
  height: calc(100vh - 460px);
  overflow: auto;

}

.success {
  color: yellowgreen;
}

</style>
