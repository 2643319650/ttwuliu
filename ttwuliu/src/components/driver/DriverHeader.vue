<template>
  <div class="head">
    <div style="width: 150px;">
      <span style="margin-left: 60px;font-size: 20px">学生寝室管理系统</span>
    </div>
    <div style="flex: 1"></div>
    <div style="width: 200px;">
      <div style="margin-right: 50px;">
        <el-dropdown>
        <span class="el-dropdown-link">
          <span v-if="null != user" style="color: white">学生：{{user.driver_name}}</span>
          <i class="el-icon-arrow-down el-icon--right"></i>
        </span>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item @click="loginout">退出登录</el-dropdown-item>
              <el-dropdown-item @click="personinfo">个人信息</el-dropdown-item>
              <el-dropdown-item @click="changeps">修改密码</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'DriverHeader',
    data() {
      return {
        user: JSON.parse(sessionStorage.getItem("driver"))
      }
    },
    methods:{
      loginout(){
        sessionStorage.clear()
        this.$router.push('/login')
      },
      personinfo(){
        this.$router.push('/driverLayout/personinformation')
      },
      changeps(){
        this.$router.push('/driverLayout/changepassword')
      }
    }
  }
</script>

<style scoped>
  .head {
    width: 100%;
    height: 60px;
    line-height: 60px;
    background-color: #3e3d3d;
    color: white;
    display: flex;
  }

  .el-dropdown-link {
    cursor: pointer;
    color: #409EFF;
  }

  .el-icon-arrow-down {
    font-size: 12px;
  }
</style>