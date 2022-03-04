<template>
  <div class="aside">
    <el-menu
      :uniqueOpened="true"
      default-active="2"
      class="el-menu-vertical-demo"
      @open="handleOpen"
      @close="handleClose"
      background-color="#545c64"
      text-color="#fff" router
      active-text-color="#409EFF">
      <el-sub-menu index="1">
        <template #title>
          <i class="el-icon-location"></i>
          <span>寝室管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/driverLayout/mydormitory">我的寝室</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="2">
      <template #title>
        <i class="el-icon-location"></i>
        <span>申请入住</span>
      </template>
      <el-menu-item-group>
        <el-menu-item index="/driverLayout/appleforleave">申请入住</el-menu-item>
      </el-menu-item-group>
    </el-sub-menu>
      <el-sub-menu index="3">
        <template #title>
          <i class="el-icon-location"></i>
          <span>水电费管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/driverLayout/checkshuidianfei">查看水电费</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="4">
        <template #title>
          <i class="el-icon-location"></i>
          <span>寝室打分管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/driverLayout/ceckscore">查看打分</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="5">
        <template #title>
          <i class="el-icon-location"></i>
          <span>违规违纪</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/driverLayout/myweiguiweiji">我的违规违纪</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="6">
        <template #title>
          <i class="el-icon-location"></i>
          <span>寝室报修</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/driverLayout/qinshibaoxiu">寝室报修</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="7">
        <template #title>
          <i class="el-icon-location"></i>
          <span>留言管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/driverLayout/checkliuyan">查看留言</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>


    </el-menu>
  </div>
</template>

<script>
  export default {
    name: 'DriverAside',
    data() {
      return {
        active: this.$route.path
      }
    },
    methods: {}
  }
</script>

<style scoped>
  .aside {
    width: 202px;
    height: calc(100vh - 50px);
    border-right: 1px solid #ccc;
    background-color: #3e3d3d;
  }
</style>