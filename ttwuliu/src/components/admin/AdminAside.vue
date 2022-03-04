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
          <span >辅导员管理</span>
        </template>
          <el-menu-item index="/adminLayout/customer">辅导员管理</el-menu-item>
      </el-sub-menu>
      <el-sub-menu index="2">
        <template #title>
          <i class="el-icon-location"></i>
          <span >学生管理</span>
        </template>
        <el-menu-item index="/adminLayout/driver">学生管理</el-menu-item>
      </el-sub-menu>
      <el-sub-menu index="3">
        <template #title>
          <i class="el-icon-location"></i>
          <span>寝室管理</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/adminLayout/dormitory">寝室管理</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="4">
        <template #title>
          <i class="el-icon-location"></i>
          <span>寝室打分</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/adminLayout/Dormscore">寝室打分</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="5">
        <template #title>
          <i class="el-icon-location"></i>
          <span>入住申请</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/adminLayout/applyfordorm">入住申请</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="6">
        <template #title>
          <i class="el-icon-location"></i>
          <span>水电费</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/adminLayout/waterfee">水电费</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="7">
        <template #title>
          <i class="el-icon-location"></i>
          <span>违规违纪</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/adminLayout/weiguiweiji">违规违纪</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="8">
        <template #title>
          <i class="el-icon-location"></i>
          <span>寝室报修</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/adminLayout/qinshibaoxiu">寝室报修</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>
      <el-sub-menu index="9">
        <template #title>
          <i class="el-icon-location"></i>
          <span>宿管留言</span>
        </template>
        <el-menu-item-group>
          <el-menu-item index="/adminLayout/suguanliuyan">宿管留言</el-menu-item>
        </el-menu-item-group>
      </el-sub-menu>

    </el-menu>
  </div>
</template>

<script>
  export default {
    name: 'Aside',
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
    background-color: #333744;
  }
</style>