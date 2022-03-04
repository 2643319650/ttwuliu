<template>
  <div>
    <!--头-->
    <AdminHeader/>

    <!--主体-->
    <div style="display:flex; ">
      <!--侧边栏-->
      <AdminAside/>
      <!-- 内容区域 -->
      <router-view style="flex: 1"/>
    </div>
  </div>
</template>

<script>
  import AdminHeader from "./AdminHeader";
  import AdminAside from "./AdminAside";

  export default {
    name: 'Layout',
    components: {
      AdminHeader,
      AdminAside
    }
  }
</script>

<style scoped>

</style>