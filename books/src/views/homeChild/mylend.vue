<template>
  <div class="mylend">
    <main-top-bar></main-top-bar>
    <div class="lendHis">借阅历史 <span @click="getMyLend">刷新<i class="el-icon-refresh-right"></i></span></div>
    <div class="lendBox">
      <div class="booksItem" v-for="(item,index) in lendBox" :key="index">
        <div id="boookIndex">序号：{{ index + 1 }}</div>
        <div class="bookPic"><img :src="item.picname" alt=""></div>
        <div class="bookInfo">
          <div id="bookName">书名：{{ item.bookname }}</div>
          <div id="author">编者:{{ item.author }}</div>
          <div id="company"> 出版社：{{ item.company }}</div>
          <div id="bookNum">图书编号：{{ item.bookid }}</div>
        </div>
        <div id="bookLocation">图书位置：{{item.booklocation}}</div>
        <div class="bookDate">
          <div id="lendDate">借阅日期:{{ item.lenddate | formatDate }}</div>
          <div id="returnDate">应还日期:{{ item.returndate | formatDate }}</div>
        </div>
        <div class="bth">
          <el-button  @click="renewal(index)">续借</el-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import {Message} from 'element-ui';
import mainTopBar from '../../components/common/mainTopBar.vue';

export default {
  components: { mainTopBar },
  name: 'mylend',
  data() {
    return {
      lendBox: [],
    }
  },
  mounted() {
    this.getMyLend();
  },
  methods: {
    getMyLend() {
      this.$axios.get('/student/studentlend')
          .then(res => {
            this.lendBox = res.data.data;
          });
    },
    addReturnTime(bookID, newdate) {
      this.$axios.get('/books/bookrenew', {
        params: {
          bookid: bookID,
          newdate: newdate
        }
      }).then(res => {
        Message.success(res.data.msg);
        this.getMyLend();
      });
    },
    renewal(index) {
      let now = Date.now();
      let remainTime = this.lendBox[index].returndate - now;
      let newdate = parseInt(this.lendBox[index].returndate) + (1000 * 60 * 60 * 24 * 7);
      newdate = newdate.toString();
      remainTime <= 1000 * 60 * 60 * 24 * 5 ? this.addReturnTime(this.lendBox[index].id, newdate) : alert('还书时间小于5天时才可继续借阅');


    }

  },
  filters: {
    //日期处理函数
    formatDate(date) {
      date = parseInt(date);
      let time = new Date(date);
      let y = time.getFullYear();
      let m = time.getMonth() + 1;
      let d = time.getDate();
      return y + '/' + m + '/' + d;
    }

  }


}
</script>

<style scoped>
.lendHis {
  text-align: center;
  position: relative;
  font-size: 19px;
  line-height: 50px;
  color: #fff;
  height: 50px;
  background: linear-gradient(to left, #2F80ED, #56CCF2, #56CCF2, #2F80ED); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
  font-family: "微软雅黑 Light";
  text-shadow: 0 10px 10px rgb(10, 77, 165);
  margin-bottom: 20px;
}

.lendHis span {
  position: absolute;
  cursor: pointer;
  right: 20px;
  top: 0;
}
.lendHis span:hover{
  opacity: 0.5;
}

.mylend {
  height: calc(100% - 40px);
}

.lendBox {
  height: calc(100% - 60px - 30px);
  background-color: #fff;
  overflow: auto;
}

.booksItem {
  display: flex;
  justify-content: flex-start;
  padding: 0 20px;
  height: 100px;
  background: linear-gradient(to left, rgba(0, 114, 255, 0.6), rgba(0, 198, 255, 0.6));
  border: 1px solid #ffffff;
  overflow: hidden;
  font-family: "微软雅黑 Light";
  text-shadow: 0 1px 5px rgb(10, 77, 165);
  color: #fff;
}

#boookIndex {
  line-height: 100px;
  margin-right: 20px;
}

.bookPic {
  display: flex;
  align-items: center;
  height: 100%;
  line-height: 100px;
  margin: 0 20px;
  vertical-align: middle;
}

.bookPic img {
  height: 80%;

}

.bookInfo {
  flex: 1;
}

.bookDate,#bookLocation {
  display: flex;
  width: 300px;
  flex-direction: column;
  justify-content: center;
  margin-right: 30px;
}

.bookDate > div {
  margin-bottom: 10px;
}

.bth {
  height: 100%;
  line-height: 100px;
}

#bookName {
  font-size: 18px;
  font-weight: 700;
  padding-top: 5px;
}

#author,
#company,
#bookNum {
  font-size: 16px;
  color: rgb(92, 92, 86);
  text-shadow: 0 0 1px rgb(114, 152, 202);
}
</style>
