<template>
  <div style="padding: 10px">
    <!-- 头信息 - 新增、搜索、批量操作 -->
    <div>

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
        <el-table-column prop="order_id" label="id" v-if="isShow"></el-table-column>
        <el-table-column prop="order_no" label="订单号码" width="95px"></el-table-column>
        <el-table-column prop="order_state" label="订单状态" width="70px">
          <template #default="scope">
            <span v-if="scope.row.order_state==0" style="color:red;">待审核</span>
            <span v-if="scope.row.order_state==1" style="color:deeppink;">运输中</span>
            <span v-if="scope.row.order_state==2" style="color:orange;">已到货</span>
            <span v-if="scope.row.order_state==3" style="color:green;">订单完成</span>
          </template>
        </el-table-column>
        <el-table-column prop="send_date" label="发货时间" width="85px"></el-table-column>
        <el-table-column prop="arrive_date" label="到达时间" width="85px"></el-table-column>
        <el-table-column prop="send_address" label="发货地址" ></el-table-column>
        <el-table-column prop="arrive_address" label="送货地址"></el-table-column>
        <el-table-column prop="order_create_date" label="订单创建时间"></el-table-column>
        <el-table-column prop="order_arrive_username" label="收件人" width="70px"></el-table-column>
        <el-table-column prop="order_arrive_usertel" label="收件人电话"></el-table-column>
        <el-table-column prop="order_driver.driver_name" label="司机名称" width="70px"></el-table-column>
        <el-table-column prop="order_tran.tran_name" label="运输工具"></el-table-column>
        <el-table-column prop="order_state" label="操作" width="200px">
          <template #default="scope">
            <el-button v-if="scope.row.order_state==0" size="mini" type="danger" v-on:click="updateOrderById(scope.row.order_id)">修改</el-button>
            <el-button v-if="scope.row.order_state==0" size="mini" type="danger" v-on:click="delOrderById(scope.row.order_id)">撤销</el-button>
            <el-button v-if="scope.row.order_state==1" size="mini" type="danger" v-on:click="updateOrderById(scope.row.order_id)">修改</el-button>
            <el-tag type="danger" v-if="scope.row.order_state==2||scope.row.order_state==3">无法操作</el-tag>
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
    <!--  弹窗  -->
    <div>
      <el-dialog title="审核客户" v-model="dialogVisible" width="35%">
        <div style="width: 350px;margin-left: 40px">
          <el-form :label-position="labelPosition" label-width="80px" :model="order_form">

            <el-form-item label="订单编号">
              <el-input v-model="order_form.order_no" readonly></el-input>
            </el-form-item>
            <el-form-item label="发货地址">
              <el-input v-model="order_form.send_address" v-if="order_form.order_state==0"></el-input>
              <el-input v-model="order_form.send_address" v-if="order_form.order_state==1" readonly></el-input>
            </el-form-item>
            <el-form-item label="送货地址">
              <el-input v-model="order_form.arrive_address" v-if="order_form.order_state==0"></el-input>
              <el-input v-model="order_form.arrive_address" v-if="order_form.order_state==1" readonly></el-input>
            </el-form-item>
            <el-form-item label="创建时间">
              <el-input v-model="order_form.order_create_date" readonly></el-input>
            </el-form-item>
            <el-form-item label="收件人员">
              <el-input v-model="order_form.order_arrive_username"></el-input>
            </el-form-item>
            <el-form-item label="联系电话">
              <el-input v-model="order_form.order_arrive_usertel"></el-input>
            </el-form-item>
            <div v-if="order_form.order_state==1">
              <el-form-item label="运费">
                <el-input v-model="order_form.order_money" readonly></el-input>
              </el-form-item>
            </div>
          </el-form>
        </div>
        <template #footer>
    <span class="dialog-footer">
      <el-button @click="close">取 消</el-button>
      <el-button type="primary" @click="updateOrder()">确认订单</el-button>
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
    name: "CustomerFindOrder",
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
        customer_form: {},
        customer12:JSON.parse(sessionStorage.getItem("customer")),
        order_form:{},
        readonly:true
      }
    },
    methods: {
      //读取列表数据
      load() {
        request.get('/api/CustomerController/findCustomerOwnOrder', {
          params: {
            /*customer_name: this.search_customer_name,*/
            currentPage: this.currentPage,
            pageSize: this.pageSize,
            customer_id:this.customer12.customer_id
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
      //撤销订单
      delOrderById(order_id){
        request.delete('/api/OrderController/delOrderById',{
          params:{
            order_id:order_id
          }
        }).then(res => {
          if(res.code==0){
            ElMessage.success({message: res.message, type: 'success'});
            this.load()
          }else{
            ElMessage.error({message: res.message, type: 'error'});
          }
        })
      },
      updateOrderById(order_id){
        this.dialogVisible=true
        request.get('/api/OrderController/adminFindOrderContent',{
          params:{
            order_id:order_id
          }
        }).then(res =>{
          this.order_form=res.data
        })
      },
      updateOrder(){
        request.put('/api/OrderController/customerUpdateOrder',this.order_form).then(res =>{
          if(res.code==0){
            ElMessage.success({message: res.message, type: 'success'});
            this.load()
            this.dialogVisible=false
          }else{
            ElMessage.error({message: res.message, type: 'error'});
          }
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