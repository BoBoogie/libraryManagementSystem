<template>
<div class="myinfo">
    <main-top-bar classify="个人信息"></main-top-bar>
    <div class="info">
        <table cellspacing='60'>
          <tr>
            <td>姓名:</td>
          <td>{{$store.state.studentinfo.studentname}}</td>
          </tr>
          <tr>
            <td>班级:</td>
            <td>{{$store.state.studentinfo.class}}</td>
          </tr>

          <tr>
            <td>学号:</td>
            <td>{{$store.state.studentinfo.account}}</td>
          </tr>
          <tr>
            <td>入学年份:</td>
            <td>{{ $store.state.date }}</td>
          </tr>
          <tr>
            <td>借阅历史:</td>
            <td>{{$store.state.studentinfo.allLendNum}}</td>
          </tr>
           <tr>
            <td>剩余应还:</td>
            <td>{{$store.state.studentinfo.needreturn}}</td>
          </tr>
        </table>
    </div>
</div>

</template>

<script>

import mainTopBar from '../../components/common/mainTopBar.vue';
export default {
   name:'myinfo',

  components: { mainTopBar },

}
</script>

<style scoped>
.myinfo{
  height: 100%;
}
.info{
  font-size:18px;
  font-family: "微软雅黑 Light";
  box-sizing: border-box;
  padding:0 0 0 100px ;
  width: 100%;
  height: calc(100% - 60px);
}

</style>
