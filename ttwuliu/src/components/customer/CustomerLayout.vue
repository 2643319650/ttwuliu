<template>
  <div>
    <!--头-->
    <CustomerHeader/>

    <!--主体-->
    <div style="display:flex; ">
      <!--侧边栏-->
      <CustomerAside/>
      <!-- 内容区域 -->
      <router-view style="flex: 1"/>
    </div>
  </div>
</template>

<script>

  import CustomerHeader from "./CustomerHeader";
  import CustomerAside from "./CustomerAside";

  export default {
    name: 'Layout',
    components: {
      CustomerHeader,
      CustomerAside
    }
  }
</script>

<style scoped>

</style>