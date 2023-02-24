<template>
<div class="mainBox">
  <transition name='fade' mode="out-in" appear>
   <keep-alive>
       <router-view :key="key" />
   </keep-alive>
  </transition>
</div>
</template>

<script>
export default {
    name:"mainBox",
  computed: {
    key() {
      return this.$route.path
    }
  }
}
</script>

<style scoped>
.mainBox{
    box-sizing: border-box;
    border: 20px solid #f0f0f0;
    height: calc(100vh - 80px);
    background-color: #f0f0f0;
    /* overflow: hidden; */

}
.fade-enter-active {
  transition: all .35s ease;
}
.fade-leave-active {
  transition: all .35s cubic-bezier(1.0, 0.5, 0.8, 1.0);
}
.fade-enter, .fade-leave-to
  /* .slide-fade-leave-active for below version 2.1.8 */ {
  opacity: 0;
}
</style>
