<template>
  <div class="login">
    <h2>基于Web的图书管理系统</h2>
    <div class="loginMethod">
      <span @click='studentLogin' :class="{loginMethodselect:loginMethods==='学生'}">学生账号登录</span>
      |<span @click='adminLogin' :class="{loginMethodselect:loginMethods==='管理员'}">管理员登录</span>
    </div>
    <transition name="fade" mode="out-in" appear>
      <main class="loginbox">
        <transition name="fade" mode="out-in" appear>
          <span class="title" key="student" v-if="loginMethods==='学生'">学生账号登录</span>
          <span class="title" v-else>管理员账号登录</span>
        </transition>
          <table key="table" style='width:100%;border-spacing: 15px;padding-left: 60px'>
            <tr>
              <td style='width:40px'>账号:</td>
              <td><input type='text' autocomplete="off" class="account" placeholder="请输入账号" name="account"
                         v-model="account"
                         @keyup="checkAccount"></td>
              <td style='width:40px'><span class="accountRemind" v-show="!accountFormat">学生账号需为13位数字</span>
              </td>
            </tr>
            <tr>
              <td style='width:40px'>密码:</td>
              <td><input type="password" class="psw" placeholder="请输入密码" name="password" v-model="password"
                         @keyup="checkPsw"></td>
              <td style='width:80px'><span class="pswRemind" v-show="!pswFormat">密码须为5-16位</span></td>
            </tr>
          </table>
          <div class="subbox" key="subbox"><input type="submit" class="submit" value='登录' ref="submit" @click="submit(account,password)"></div>
          <div class='forgetPsw'>
            <transition name="fade" mode="out-in" appear>
            <span id="resetPsw" v-if="loginMethods==='学生'" @click="resetPsw">忘记密码?</span>
          </transition>
          </div>
      </main>
    </transition>
  </div>
</template>

<script>
export default {
  name: 'login',
  data() {
    return {
      loginMethods: '学生',
      accountFormat: true,
      pswFormat: true,
      account: '',
      password: '',
    }
  },
  mounted() {
    this.$refs.submit.disabled = true;
  },
  methods: {
    // 选择学生登录
    studentLogin() {
      this.loginMethods = '学生';
    },
    // 管理员身份登录
    adminLogin() {
      this.loginMethods = '管理员';
    },
    // 忘记密码跳转路由
    resetPsw() {
      alert('请联系后台管理');
    },
    // 检查账号是否符合规范
    checkAccount() {
      let checkAccount = /^\d{13}$/;
      let accountTest = checkAccount.test(event.target.value);
      if ( !accountTest && this.loginMethods === '学生') {
        this.$refs.submit.disabled = true;
        return this.accountFormat = false;
      }
      this.accountFormat = true;
      this.btndisabled();
      this.checkEnter()
    },
    // 检查密码是否符合规范
    checkPsw() {
      let checkPsw = /^\S{5,16}$/;
      let pswTest = checkPsw.test(event.target.value)
      if ( !pswTest) {
        this.$refs.submit.disabled = true;
        return this.pswFormat = false;
      }
      this.pswFormat = true;
      this.btndisabled();
      this.checkEnter()
    },
    // 按下回车实现登录
    checkEnter() {
      if (event.keyCode === 13) {
        this.$refs.submit.click();
      }
    },
    // 提交按钮启用函数
    btndisabled() {
      if (this.accountFormat && this.pswFormat) {
        this.$refs.submit.disabled = false;
      }
    },
    submit(account, password) {
      if (this.loginMethods === '学生') {
        this.$axios.post('/login/studentlogin', {
          account,
          password,
        })
            .then(res => {
              if (res.data.msg === '登录成功') {
                window.localStorage.token = res.data.token;
                this.$router.replace('/home');
              }

            })
            .catch(err => console.log(err));
      }
      if (this.loginMethods === '管理员') {
        this.$axios.post('/login/adminlogin', {
          account,
          password,
        }).then(res => {
          if (res.data.msg === '登录成功') {
            window.localStorage.token = res.data.token;
            this.$router.replace('/admin');
            this.$store.state.studentinfo = []
          }

        }).catch(err => {
          console.log(err)
        });
      }
    }

  }


}
</script>

<style scoped>
h2 {
  font-size: 40px;
  font-family: "微软雅黑 Light";
  margin-top: 5vh;
  text-align: center;
  color: #ffffff;
  text-shadow: 0 15px 8px rgb(255, 255, 255);
}

.login {
  width: 100vw;
  height: 100vh;
  background-image: url("~@/assets/background/library.png");
  background-size: cover;
  overflow: hidden;
}

.loginMethod {
  font-family: "微软雅黑 Light";
  box-sizing: border-box;
  margin: 0 10px;
  padding-right: 20px;
  text-align: right;
  cursor: pointer;
  color: rgba(255, 255, 255, 0.5);
}

.loginMethod span:hover {
  color: #fff;
}

.loginbox {
  width: 30vw;
  min-width: 200px;
  max-width: 500px;
  margin: auto;
  margin-top: 20vh;
  padding: 30px 20px;
  border-radius: 15px;
  background: linear-gradient(to left, rgba(0, 114, 255, 0.2), rgba(0, 198, 255, 0.2));
  border: 1px solid #ffffff;
  box-shadow: 0 0 5px 5px rgba(255, 255, 255, 0.5);
}

.title {
  font-family: "微软雅黑 Light";
  color: #fff;
  text-shadow: 0 0 10px rgb(10, 77, 165);
  margin-bottom: 20px;
  font-size: 23px;
  text-align: center;
  float: top;
  display: flex;
  justify-content: center;
}

.title span {
  position: absolute;
}

tr td:nth-child(2) {
  display: block;
  width: 100%;
}

td {
  font-family: "微软雅黑 Light";
  color: #fff;
  text-shadow: 0 0 10px rgb(10, 77, 165);
}

.account,
.psw {
  width: 90%;
  height: 40px;
  outline: none;

  padding-left: 20px;
  border: 1px solid rgb(0, 132, 255);
  border-radius: 8px;
}

.subbox {
  margin-top: 20px;
  text-align: center;
}

.submit {
  width: 80px;
  text-align: center;
  font-family: "微软雅黑 Light";
  color: #fff;
  text-shadow: 0 0 10px rgb(10, 77, 165);
  padding: 10px 15px;
  border-radius: 10px;
  outline: none;
  border: 1px solid #ffffff;
  cursor: pointer;
  background: linear-gradient(to left, rgba(0, 114, 255, 0.3), rgba(0, 198, 255, 0.3));
}

.submit:hover {
  background: linear-gradient(to left, rgba(0, 114, 255, 0.5), rgba(0, 198, 255, 0.5));
}

.forgetPsw {
  font-size: 16px;
  font-family: "微软雅黑 Light";
  color: rgba(255, 255, 255, 0.5);
  text-shadow: 0 0 10px rgb(10, 77, 165);
  text-align: right;
}

.forgetPsw span:hover {
  color: #fff;
}

.loginMethodselect {
  font-family: "微软雅黑 Light";
  color: #fff;
  text-shadow: 0 0 1px rgb(255, 255, 255);
}

#resetPsw {
  cursor: pointer;
}

.accountRemind,
.pswRemind {
  font-size: 10px;
  color: red;
}

.accountRemind::before,
.pswRemind::before {
  content: 'x';
  display: inline-block;
  color: #fff;
  margin-right: 2px;
  line-height: 16px;
  text-align: center;
  width: 16px;
  height: 16px;
  background-color: #e00;
  border-radius: 8px;
}

.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.fade-enter-active{
  transition: all 1s;
}

</style>
