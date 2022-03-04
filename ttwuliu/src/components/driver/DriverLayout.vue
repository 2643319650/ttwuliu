<template>
  <div>
    <!--头-->
    <DriverHeader/>
    <!--主体-->
    <div style="display:flex; ">
      <!--侧边栏-->
      <DriverAside/>
      <!-- 内容区域 -->
      <router-view style="flex: 1"/>
    </div>
  </div>
</template>

<script>
  import DriverHeader from "./DriverHeader";
  import DriverAside from "./DriverAside";


  export default {
    name: 'DriverLayout',
    components: {
      DriverHeader,
      DriverAside
    }
  }
</script>

<style scoped>

</style>