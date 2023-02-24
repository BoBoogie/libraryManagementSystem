<template>
  <div class="maintop">{{ classify }}</div>
</template>

<script>
export default {
  name: 'mainTopBar',
  props: {
    classify: {
      type: String,
      default() {
        return '我的借阅'
      }
    }
  }

}
</script>

<style>
.maintop {

  position: sticky;
  top: 20px;
  width: 100%;
  height: 60px;
  text-align: center;
  font-size: 20px;
  line-height: 60px;
  margin-bottom: 20px;
  background-image: linear-gradient(to right, rgba(0, 210, 255, 0.98), #3a7cd7);
  font-family: "微软雅黑 Light";
  color: #fff;
  text-shadow: 0 10px 10px rgb(10, 77, 165);
}

</style>
