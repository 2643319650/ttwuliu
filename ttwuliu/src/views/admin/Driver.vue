<template>
  <div style="padding: 10px">
    <!-- 头信息 - 新增、搜索、批量操作 -->
    <div>
      <div style="float: left;margin: 10px">
        <el-button type="success" round @click="open">新增司机</el-button>
      </div>

      <div style="margin-top: 10px; float: right;margin-right: 50px">
        <el-input placeholder="请输入名称" v-model="search_drver_name" clearable style="width: 200px"></el-input>
        <el-button type="primary" round style="margin-left: 5px" @click="load()">查询</el-button>
      </div>

    </div>
    <!-- 表格 -->
    <div style="margin-top: 10px">
      <el-table
          ref="multipleTable"
          :data="tableData"
          :cell-style="{textAlign:'center'}"
          :header-cell-style="{textAlign:'center'}"
          tooltip-effect="dark"
          style="width: 100%"
      >
        <el-table-column prop="driver_id" label="id" v-if="isShow"></el-table-column>
        <el-table-column prop="driver_name" label="司机名称"></el-table-column>
        <el-table-column prop="driver_username" label="司机昵称"></el-table-column>
        <div style="display: none">
          <el-table-column prop="driver_password" type="hidden" label="司机登录密码"></el-table-column>
        </div>

        <el-table-column prop="driver_state" label="司机状态">
          <template #default="scope">
            <el-tag type="success" v-if="scope.row.driver_state==0">空闲</el-tag>
            <el-tag type="danger" v-if="scope.row.driver_state==1">忙碌</el-tag>
          </template>
        </el-table-column>

        <el-table-column label="操作">
          <template #default="scope">
            <el-button size="mini" type="primary" icon="el-icon-edit"
                       @click="findDriverById(scope.row.driver_id)">
              编辑
            </el-button>
            <!--            <el-button size="mini" type="danger" icon="el-icon-delete" circle-->
            <!--                       @click="updateDriverStateById(scope.row.tran_id)">-->
            <!--              停职-->
            <!--            </el-button>-->
            <!--            <el-button v-if="scope.row.driver_state==2" size="mini" type="success" icon="el-icon-delete" circle-->
            <!--                       @click="updateDriverStateById(scope.row.tran_id)">-->
            <!--              复职-->
            <!--            </el-button>-->
          </template>
        </el-table-column>
      </el-table>
    </div>
    <!-- 分页 -->
    <div style="margin-top: 10px">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-sizes="[5, 10, 15]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>
    <!-- 弹窗 -->
    <div>
      <el-dialog title="编辑司机" v-model="dialogVisible" width="35%">
        <div style="width: 350px;margin-left: 40px">
          <el-form :label-position="labelPosition" label-width="80px" :model="driver_form">
            <el-form-item label="司机名称">
              <el-input v-model="driver_form.driver_name"></el-input>
            </el-form-item>
            <el-form-item label="司机昵称">
              <el-input v-model="driver_form.driver_username"></el-input>
            </el-form-item>
            <div>
              <el-form-item label="登录密码">
                <el-input type="password" v-model="driver_form.driver_password"></el-input>
              </el-form-item>
            </div>

          </el-form>
        </div>
        <template #footer>
    <span class="dialog-footer">
      <el-button @click="dialogVisible = false">取 消</el-button>
      <el-button type="primary" @click="saveDriver" v-if="driver_form.driver_id == null">增加司机</el-button>
      <el-button type="primary" @click="updateDriver" v-if="driver_form.driver_id != null">修改司机</el-button>
    </span>
        </template>
      </el-dialog>
    </div>
  </div>
</template>

<script>
import request from "../../utils/request";
import {ElMessage} from 'element-plus'

export default {
  name: "Car",
  data() {
    return {
      //表格数据
      tableData: [],
      //弹窗
      dialogVisible: false,
      //快捷查询的名称
      search_drver_name: '',
      //当前页数
      currentPage: 1,
      //每页大小
      pageSize: 5,
      //总条数
      total: 0,
      //隐藏项目
      isShow: false,
      //表单对齐方式
      labelPosition: 'right',
      //表单数据
      driver_form: {}
    }
  },
  methods: {
    //读取列表数据
    load() {
      request.get('/api/DriverController/findDriverList', {
        params: {
          driver_name: this.search_drver_name,
          currentPage: this.currentPage,
          pageSize: this.pageSize
        }
      }).then(res => {
        console.log(res)
        this.tableData = res.data.list
        this.total = res.data.total
      })
    },
    //改变每页条数
    handleSizeChange(val) {
      this.pageSize = val
      this.load()
    },
    //改变当前页
    handleCurrentChange(val) {
      this.currentPage = val
      this.load()
    },
    // 增加打卡窗口
    open() {
      this.driver_form = {}
      this.dialogVisible = true
    },

    //增加司机
    saveDriver() {
      request.post('/api/DriverController/saveDriver', this.driver_form).then(res => {
        if (res.code == 0) {
          ElMessage.success({
            message: res.message,
            type: 'success'
          });
        } else {
          ElMessage.error({
            message: res.message,
            type: 'error'
          });
        }
        //关闭对话框
        this.dialogVisible = false
        //load数据
        this.load()
      })
    },
    /*
    * 停职司机
    * */
    updateDriverStateById(driver_id) {
      request.put('/api/DriverController/updateDriverStateById', driver_id).then(res => {
        if (res.code == 0) {
          ElMessage.success({message: res.message, type: 'success'});
        } else {
          ElMessage.error({message: res.message, type: 'error'});
        }
      })
    },
    /*提前查询*/
    findDriverById(driver_id) {
      this.dialogVisible = true
      request.get('/api/DriverController/findDriverById', {
        params: {
          driver_id: driver_id
        }
      }).then(res => {
        if (res.code == 0) {
          this.dialogVisible = true
          this.driver_form = res.data

        } else {
          ElMessage.error({
            message: res.message,
            type: 'error'
          });
        }
      })
    },
    /*修改*/
    updateDriver() {
      request.put('/api/DriverController/updateDriver', this.driver_form).then(res => {
        if (res.code == 0) {
          ElMessage.success({
            message: res.message,
            type: 'success'
          });
        } else {
          ElMessage.error({
            message: res.message,
            type: 'error'
          });
        }
        this.dialogVisible = false
        this.load()
      })
    }


  },
  created() {
    this.load()
  }
}
</script>

<style scoped>

</style>