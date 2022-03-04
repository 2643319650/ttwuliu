<template>
  <main class="el-main">
    <div style="width: 100%;">
      <!--辅导员管理页的搜索区域-->
      <div class="el-row" style="border-bottom: 2px solid rgb(95, 139, 198);">
        <div class="teacher-search-header" style="float: right">
          <form class="el-form">
            <!-- 辅导员姓名-->
            <div class="el-col el-col-8">
              <div class="el-form-item">
                <label class="el-form-item__label" style="width: 100px;">
                  辅导员姓名</label>
                <div class="el-form-item__content" style="margin-left: 20px;">
                  <div class="el-input el-input--suffix" style="width: 273px;"><!---->
                    <input type="text" v-model="search_customer_name" autocomplete="off" placeholder="请输入辅导员姓名" class="el-input__inner"><!----><!----><!----><!---->
                  </div><!---->
                </div>
              </div>
            </div>
            <!-- 辅导员学院-->
            <div class="el-col el-col-8">
              <div class="el-form-item">
                <label class="el-form-item__label" style="width: 100px; margin-left: 130px;">学院</label>
                <div class="el-form-item__content" style="margin-left: 20px;">
                  <div class="el-input el-input--suffix" style="width: 273px;"><!---->
                    <input type="text" v-model="search_customer_college" autocomplete="off" placeholder="请输入辅导员学院" class="el-input__inner"><!----><!----><!----><!---->
                  </div><!---->
                </div>
              </div>
            </div>
            <!-- 辅导员工号-->
            <div class="el-col el-col-8">
              <div class="el-form-item">
                <label class="el-form-item__label" style="width: 100px;margin-left: 130px;">工号</label>
                <div class="el-form-item__content" style="margin-left: 20px;">
                  <div class="el-input el-input--suffix" style="width: 274px;"><!---->
                    <input type="number" v-model="search_customer_no" autocomplete="off" placeholder="请输入辅导员工号" class="el-input__inner"><!----><!----><!----><!---->
                  </div><!---->
                </div>
              </div>
            </div>
          </form>
          <!--重置/搜索按钮-->
          <span class="teacher-search-operation" style="float: right;padding-inline: 10px">
            <button type="button" class="el-button el-button--default" @click="clear"><!---->
              <i class="el-icon-remove-outline"></i>
              <span>Clear</span></button>
            <button type="button" class="el-button el-button--primary" @click="load()"><!---->
              <i class="el-icon-search"></i>
              <span>Search</span>
            </button>
          </span>
        </div>
      </div>
<!--      搜索下面的新增按钮-->
      <div class="table-header">
        <span class="teacher-new-operation" >
          <button type="button" class="el-button el-button--primary" @click="open">
            <i class="el-icon-circle-plus-outline"></i>
            <span>New</span>
          </button>
        </span>
      </div>

<!--      主体-->
      <div style="margin-top: 10px">
        <el-table
            ref="multipleTable"
            :data="tableData"
            stripe
            :cell-style="{textAlign:'center'}"
            :header-cell-style="{textAlign:'center'}"
            tooltip-effect="dark"
            style="width: 100%"
        >
          <el-table-column prop="customer_id" label="id" v-if="isShow"></el-table-column>
          <el-table-column prop="customer_name" label="姓名"></el-table-column>
          <el-table-column prop="customer_no" label="工号"></el-table-column>
          <el-table-column prop="customer_sex" label="性别"></el-table-column>
          <el-table-column prop="customer_college" label="学院"></el-table-column>
          <el-table-column prop="customer_tel" label="电话"></el-table-column>
          <el-table-column prop="customer_username" label="账号"></el-table-column>

          <el-table-column label="操作">
            <template #default="scope">
              <el-button size="mini" type="primary" icon="el-icon-edit"
                         @click="findCustomerById(scope.row.customer_id)">
                Edit
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>

<!--      分页-->
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

<!--      编辑辅导员弹窗-->
      <div>
        <el-dialog title="辅导员信息" v-model="dialogVisible" width="35%">
          <div style="width: 350px;margin-left: 40px">
            <el-form :label-position="labelPosition" label-width="80px" :model="customer_form">
              <el-form-item label="姓名">
                <el-input v-model="customer_form.customer_name"></el-input>
              </el-form-item>
              <el-form-item label="工号">
                <el-input v-model="customer_form.customer_no"></el-input>
              </el-form-item>
              <el-form-item label="性别">
                <el-input v-model="customer_form.customer_sex"></el-input>
              </el-form-item>
              <el-form-item label="学院">
                <el-input v-model="customer_form.customer_college"></el-input>
              </el-form-item>
              <el-form-item label="电话">
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
              <el-button type="primary" @click="saveCustomer" v-if="customer_form.customer_id == null">确认</el-button>
              <el-button type="primary" @click="updateCustomer" v-if="customer_form.customer_id != null">保存</el-button>
            </span>
          </template>
        </el-dialog>
      </div>

    </div>
  </main>
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
        search_customer_college:'',
        search_customer_no:'',
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
      //清空筛选条件
      clear(){
        this.search_customer_college = ''
        this.search_customer_name = ''
        this.search_customer_no = ''
      },
      //读取列表数据
      load() {
        request.get('/api/CustomerController/findCustomerList', {
          params: {
            customer_name: this.search_customer_name,
            customer_college: this.search_customer_college,
            customer_no:this.search_customer_no,
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
.el-main{
  padding-bottom: 0;
}
.teacher-new-operation{
  float: right;
  padding-top: 10px;
}
</style>