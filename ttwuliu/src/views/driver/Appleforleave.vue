<template>
  <div style="padding-left: 10px">
    <!-- 搜索框和批量操作框 -->
    <div style="margin-top: 20px;display: flex">
      <div>
        <el-button type="success" @click="findOneOrder">进行中的运单</el-button>
      </div>
      <div style="flex: 1"></div>
      <div style="width: 270px;display: flex;margin-right: 20px">
        <el-input placeholder="请输入目的地" v-model="search_address" clearable></el-input>
        <el-button type="primary" icon="el-icon-search" style="margin-left: 5px" @click="searchByName">搜索</el-button>
      </div>
    </div>
    <!-- 表格  -->
    <div style="margin: 10px">
      <el-table
        :data="tableData"
        style="width: 100%"
        :header-cell-style="{textAlign:'center'}"
        :cell-style="{textAlign:'center'}"
        ref="multipleTable"
        tooltip-effect="dark">
        <el-table-column prop="order_no" label="运单号" width="100"></el-table-column>
        <el-table-column prop="send_date" label="发货日期" width="120"></el-table-column>
        <el-table-column prop="arrive_date" label="到货日期" width="120"></el-table-column>
        <el-table-column prop="order_create_date" label="运单创建时间" width="120"></el-table-column>
        <el-table-column prop="order_customer.customer_name" label="下单客户" width="80"></el-table-column>
        <el-table-column prop="send_address" label="发货地址" width="100"></el-table-column>
        <el-table-column prop="arrive_address" label="收货地址" width="100"></el-table-column>
        <el-table-column prop="order_arrive_username" label="收货人姓名" width="100"></el-table-column>
        <el-table-column prop="order_arrive_usertel" label="收货人电话" width="120"></el-table-column>
        <el-table-column prop="order_money" label="运费" width="70"></el-table-column>
        <el-table-column prop="order_tran.tran_name" label="运输工具" width="70"></el-table-column>
        <el-table-column prop="order_state" label="运单状态" width="70">
          <template #default="scope">
            <span v-if="scope.row.order_state==0" style="color: red">待审核</span>
            <span v-if="scope.row.order_state==1" style="color: darkgoldenrod">运输中</span>
            <span v-if="scope.row.order_state==2" style="color: green">已到货</span>
            <span v-if="scope.row.order_state==3" style="color: salmon">订单完成</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="100">
          <template #default="scope">
            <el-popconfirm v-if="scope.row.order_state!=3" title="确定进行下一步吗？"
                           @confirm="changeOrderState(scope.row.order_id,scope.row.order_state,scope.row.order_tran.tran_id,scope.row.order_driver.driver_id)">
              <template #reference>
                <el-button size="mini" type="success">下一步</el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
      <!-- 分页 -->
      <div class="block">
        <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage"
          :page-sizes="[5, 10]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
        </el-pagination>
      </div>
    </div>
    <!-- 弹窗 -->
    <div>
      <el-dialog title="添加用户" v-model="dialogVisible" width="35%">
        <div style="width: 350px;margin-left: 40px">
          <el-form :label-position="labelPosition" label-width="100px" :model="order_form">
            <el-form-item label="运单号">
              <el-input v-model="order_form.order_no" readonly></el-input>
            </el-form-item>
            <el-form-item label="发货地址">
              <el-input v-model="order_form.send_address" readonly></el-input>
            </el-form-item>
            <el-form-item label="目的地">
              <el-input v-model="order_form.arrive_address" readonly></el-input>
            </el-form-item>
            <el-form-item label="收货人姓名">
              <el-input v-model="order_form.order_arrive_username" readonly></el-input>
            </el-form-item>
            <el-form-item label="收货人电话">
              <el-input v-model="order_form.order_arrive_usertel" readonly></el-input>
            </el-form-item>
            <el-form-item label="运单到达时间">
              <el-input v-model="order_form.arrive_date" readonly></el-input>
            </el-form-item>
          </el-form>
        </div>
        <template #footer>
    <span class="dialog-footer">
      <el-button @click="dialogVisible = false">取 消</el-button>
      <el-button type="primary"
                 @click="changeOrderState(order_form.order_id,order_form.order_state,order_form.order_tran.tran_id,order_form.order_driver.driver_id)">下一步</el-button>
    </span>
        </template>
      </el-dialog>
    </div>
  </div>
</template>

<script>
  import request from "../../utils/request";
  import {ElMessage} from "element-plus";

  export default {
    name: "DriverOrderTable",
    data() {
      return {
        driver: JSON.parse(sessionStorage.getItem('driver')),
        tableData: [],//表单数据
        total: 0,//数据总数
        pageSize: 5,//每页显示条数
        currentPage: 1,//当前页数
        search_address: '',
        dialogVisible: false,//添加弹框默认不显示
        dialogVisible2: false,//修改弹框默认不显示
        order_form: {}, //正在进行的运单
        upid: [], //用于存储修改状态所需id
      }
    },
    methods: {
      //发送数据请求
      load() {
        request.get('/api/DriverController/findOrderByDid', {
          params: {
            driver_id: this.driver.driver_id,
            search_address: this.search_address,
            currentPage: this.currentPage,
            pageSize: this.pageSize
          }
        }).then(res => {
          this.tableData = res.data.list
          this.total = res.data.total
          this.pageSize = res.data.pageSize
          this.currentPage = res.data.currentPage
        })
      },
      //改变每页条数
      handleSizeChange(val) {
        this.pageSize = val
        this.load()
      },
      //改变当前页数
      handleCurrentChange(val) {
        this.currentPage = val
        this.load()
      },
      //修改运单状态
      changeOrderState(order_id, order_state, tran_id, driver_id) {
        this.upid[0] = order_id
        this.upid[1] = order_state
        this.upid[2] = driver_id
        this.upid[3] = tran_id

        console.log("aa:" + order_id + "-" + order_state + "-" + tran_id + "-" + driver_id)
        request.put('/api/DriverController/changeOrderState', this.upid).then(res => {
          this.load()
          ElMessage.success({message: res.message, type: 'success'});
        })
        this.dialogVisible = false
      },
      searchByName() {  //搜索
        this.load()
      },
      findOneOrder() {  //查询正在进行的运单
        request.get('/api/DriverController/findOneOrder', {
          params: {
            driver_id: this.driver.driver_id
          }
        }).then(res => {
          if (res.code == 0) {
            this.order_form = res.data
            this.dialogVisible = true
          } else {
            ElMessage.success({message: res.message, type: 'success'});
          }
        })
      },
    },
    created() {
      this.load()
    }
  }
</script>

<style scoped>

</style>