<template>

  <el-config-provider :locale="locale">
    <router-view/>
  </el-config-provider>
</template>
<script>
  import zhCn from 'element-plus/lib/locale/lang/zh-cn'
  import { ElConfigProvider } from 'element-plus/es'
  export default {
    name: 'App',
    components: {
      ElConfigProvider,
    },
    data(){
      return {
        locale: zhCn,
      }
    }
  }
</script>
<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
