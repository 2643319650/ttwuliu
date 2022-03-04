<template>
  <div style="padding: 10px">
    <!-- 头信息 - 新增、搜索、批量操作 -->
    <div>
      <div style="float: left;margin: 10px">
        <el-button type="success" round @click="open">新增客户</el-button>
      </div>

      <div style="margin-top: 10px; float: right;margin-right: 50px">
        <el-input placeholder="请输入名称" v-model="search_customer_name" clearable style="width: 200px"></el-input>
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
        <el-table-column prop="customer_id" label="id" v-if="isShow"></el-table-column>
        <el-table-column prop="customer_name" label="客户名称"></el-table-column>
        <el-table-column prop="customer_username" label="客户昵称"></el-table-column>
        <el-table-column prop="customer_tel" label="客户电话"></el-table-column>

        <el-table-column label="操作">
          <template #default="scope">
            <el-button size="mini" type="primary" icon="el-icon-edit"
                       @click="findCustomerById(scope.row.customer_id)">
              编辑
            </el-button>
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
      <el-dialog title="编辑客户" v-model="dialogVisible" width="35%">
        <div style="width: 350px;margin-left: 40px">
          <el-form :label-position="labelPosition" label-width="80px" :model="customer_form">
            <el-form-item label="客户姓名">
              <el-input v-model="customer_form.customer_name"></el-input>
            </el-form-item>
            <el-form-item label="客户电话">
              <el-input v-model="customer_form.customer_tel"></el-input>
            </el-form-item>
            <el-form-item label="用户名">
              <el-input v-model="customer_form.customer_username"></el-input>
            </el-form-item>
            <el-form-item label="登录密码">
              <el-input type="password" v-model="customer_form.customer_password"></el-input>
            </el-form-item>
          </el-form>
        </div>
        <template #footer>
    <span class="dialog-footer">
      <el-button @click="dialogVisible = false">取 消</el-button>

      <el-button type="primary" @click="saveCustomer" v-if="customer_form.customer_id == null">增加客户</el-button>
      <el-button type="primary" @click="updateCustomer" v-if="customer_form.customer_id != null">>修改客户</el-button>
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
    name: "Customer",
    data() {
      return {
        //表格数据
        tableData: [],
        //弹窗
        dialogVisible: false,
        //快捷查询的名称
        search_customer_name: '',
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
        customer_form: {}
      }
    },
    methods: {
      //读取列表数据
      load() {
        request.get('/api/CustomerController/findCustomerList', {
          params: {
            customer_name: this.search_customer_name,
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
        this.customer_form = {}
        this.dialogVisible = true
      },

      //增加客户
      saveCustomer() {
        request.post('/api/CustomerController/saveCustomer', this.customer_form).then(res => {
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
      deleteCustomer(customer_id) {
        request.delete('/api/CustomerController/deleteCustomer', {
          params: {
            customer_id: customer_id
          }
        }).then(res => {
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
          //load数据
          this.load()
        })
      },
      /*提前查询*/
      findCustomerById(customer_id) {
        this.dialogVisible = true
        request.get('/api/CustomerController/findCustomerById', {
          params: {
            customer_id: customer_id
          }
        }).then(res => {
          if (res.code == 0) {
            this.dialogVisible = true
            this.customer_form = res.data

          } else {
            ElMessage.error({
              message: res.message,
              type: 'error'
            });
          }
        })
      },
      /*修改*/
      updateCustomer() {
        request.put('/api/CustomerController/updateCustomer', this.customer_form).then(res => {
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