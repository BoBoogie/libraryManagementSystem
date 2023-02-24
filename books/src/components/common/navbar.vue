<template>
  <div class="navbar">
    <header class="nav">
      <div class="logo">
        <img src="~/assets/logo/librarylogo.png" class="logoimg">
        <span>图书管理系统<i class="el-icon-reading"></i></span>

      </div>
      <div class="user">欢迎你&nbsp;&nbsp;{{ $store.state.studentinfo.studentname || '管理员'}},
        <span class="exit" @click="loginExit">退出登录</span>
      </div>
    </header>
  </div>
</template>

<script>
import {Message} from 'element-ui';

export default {
  name: 'navbar',
  data() {
    return {
      user: '',
    }
  },
  methods: {
    loginExit() {
      localStorage.token = null;
      Message.success('退出登录成功')
      this.$router.push('/login');
    }
  }

}
</script>

<style scoped>
.nav {
  display: flex;
  justify-content: space-between;
  box-sizing: border-box;
  width: 100vw;
  height: 80px;
  line-height: 80px;
  padding: 0 10px;
  background: linear-gradient(to left, #2F80ED, #56CCF2, #56CCF2, #2F80ED); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
  font-family: "微软雅黑 Light";
  text-shadow: 0 10px 10px rgb(10, 77, 165);
  color: #fff;
}

.logo {
  display: flex;
  overflow: hidden;
  font-size: 23px;
  font-weight: 500;
  height: 100%;
  align-items: center;
}

.user {
  height: 100%;
  font-size: 16px;
}

.exit {
  cursor: pointer;
  font-size: 13px;
  color: rgb(157, 253, 253);
}

.exit:hover {
  opacity: 0.5;
}

.logoimg {
  height: 75px;
  padding-right: 30px;
}
</style>
