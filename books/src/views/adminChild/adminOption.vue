<template>
  <div class="adminOption">
    <el-menu :default-openeds="['0','1','2','3','4']">
      <el-menu-item
          index="0"
          @click="$router.replace(address[8])"
          :class="{'is-active':$route.path===address[8]}">
        <i :class="className[0].icon"></i>
        <span slot="title">首页</span>
      </el-menu-item>
      <el-submenu index="1">
        <template slot="title"><i class="el-icon-menu"></i>借阅管理</template>
        <el-menu-item index="1-1" @click="$router.replace(address[0])" :class="{'is-active':$route.path===address[0]}">
          借书
        </el-menu-item>
        <el-menu-item index="1-2" @click="$router.replace(address[1])" :class="{'is-active':$route.path===address[1]}">
          还书
        </el-menu-item>
      </el-submenu>
      <el-submenu index="2">
        <template slot="title"><i class="el-icon-notebook-1"></i>图书管理</template>
        <el-menu-item index="2-1" @click="$router.replace(address[2])" :class="{'is-active':$route.path===address[2]}">
          添加图书
        </el-menu-item>
        <el-menu-item index="2-2" @click="$router.replace(address[3])" :class="{'is-active':$route.path===address[3]}">
          图书搜索
        </el-menu-item>
        <el-menu-item index="2-3" @click="$router.replace(address[4])" :class="{'is-active':$route.path===address[4]}">
          图书管理
        </el-menu-item>
      </el-submenu>
      <el-submenu index="3">
        <template slot="title"><i class="el-icon-user"></i>用户管理</template>
        <el-menu-item index="3-1" @click="$router.replace(address[5])" :class="{'is-active':$route.path==address[5]}">
          添加用户
        </el-menu-item>
        <el-menu-item index="3-2" @click="$router.replace(address[6])" :class="{'is-active':$route.path==address[6]}">
          用户管理
        </el-menu-item>

      </el-submenu>
      <el-submenu index="4">
        <template slot="title"><i class="el-icon-setting"></i>账号管理</template>
        <el-menu-item index="4-1" @click="$router.replace(address[7])">修改密码</el-menu-item>
      </el-submenu>
    </el-menu>
  </div>
</template>

<script>
export default {
  name: 'adminOption',
  data() {
    return {
      className: [
        {
          option: '首页',
          url: '/homeScreen',
          icon: 'el-icon-house'
        }
      ],
      address: [
        '/admin/lendbook',
        '/admin/returnbook',
        '/admin/addbook',
        '/admin/booksearch',
        '/admin/bookmanage',
        '/admin/addstudent',
        '/admin/allstudent',
        '/admin/changepassword',
        '/admin/homeScreen']
    }
  },
  methods: {
    // 点击跳转路由
    classifyChange(url) {
      this.$router.replace('/admin' + url);
    }
  }
}
</script>

<style scoped>

</style>
