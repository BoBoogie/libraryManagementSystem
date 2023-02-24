<template>
  <div class="homeOption">
    <el-col :span="24">
      <el-menu
          v-for="item in className" :key="item.url"
          @click="classifyChange(item.url)"
          :default-active="$route.path"
          :router="true"
          class="el-menu-vertical-demo"
      >
        <el-menu-item :index="'/home'+item.url" style="padding-left: 40px;">
          <i :class="item.icon"></i>
          <span slot="title">{{ item.option }}</span>
        </el-menu-item>
      </el-menu>
    </el-col>
  </div>
</template>

<script>
export default {
  name: 'homeOption',
  data() {
    return {
      className: [
        {
          option: '首页',
          url: '/homeScreen',
          icon: 'el-icon-house'
        }, {
          option: '我的借阅',
          url: '/mylend',
          icon: 'el-icon-reading'
        }, {
          option: '图书查询',
          url: '/booksearch',
          icon: 'el-icon-search'
        },
        {
          option: '个人信息',
          url: '/myinfo',
          icon: 'el-icon-user-solid'
        },
        {
          option: '修改密码',
          url: '/changepsw',
          icon: 'el-icon-s-tools',
        }]
    }
  },
  methods: {
    // 点击跳转路由
    classifyChange(url) {
      this.$router.push('/home' + url);
    },
  }
}
</script>

<style scoped>

</style>
