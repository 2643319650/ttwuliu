<template>
  <div style="padding: 10px">

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
        <el-table-column prop="order_no" label="订单号码"></el-table-column>
        <el-table-column prop="order_state" label="订单状态" width="100px">
          <template #default="scope">
            <span v-if="scope.row.order_state==0" style="color:red;">待审核</span>
            <span v-if="scope.row.order_state==1" style="color: aquamarine">运输中</span>
            <span v-if="scope.row.order_state==2" style="color:orange;">已到货</span>
            <span v-if="scope.row.order_state==3" style="color:green;">订单完成</span>
          </template>
        </el-table-column>
        <el-table-column prop="send_date" label="发货时间"></el-table-column>
        <el-table-column prop="arrive_date" label="到达时间"></el-table-column>
        <el-table-column prop="send_address" label="发货地址"></el-table-column>
        <el-table-column prop="arrive_address" label="送货地址"></el-table-column>
        <el-table-column prop="order_create_date" label="订单创建时间"></el-table-column>
        <el-table-column prop="order_arrive_username" label="收件人"></el-table-column>
        <el-table-column prop="order_arrive_usertel" label="收件人电话"></el-table-column>
        <el-table-column label="操作">
          <template #default="scope">
            <el-button v-if="scope.row.order_state==0" size="mini" type="primary"
                       @click="findOrderById(scope.row.order_id)">审核订单
            </el-button>
            <el-tag type="success" v-if="scope.row.order_state==1">运输中</el-tag>
            <el-tag type="success" v-if="scope.row.order_state==2">已到货</el-tag>
            <el-tag type="success" v-if="scope.row.order_state==3">订单完成</el-tag>
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
      <el-dialog title="审核客户" v-model="dialogVisible" width="35%">
        <div style="width: 350px;margin-left: 40px">
          <el-form :label-position="labelPosition" label-width="80px" :model="order_form">

            <el-form-item label="订单编号">
              <el-input v-model="order_form.order_no" readonly></el-input>
            </el-form-item>
            <el-form-item label="发货时间">
              <el-date-picker v-model="order_form.send_date" type="datetime" placeholder="选择日期时间"
                              value-format="YYYY-MM-DD HH:mm:ss"></el-date-picker>
            </el-form-item>
            <el-form-item label="到货时间">
              <el-date-picker v-model="order_form.arrive_date" type="datetime" placeholder="选择日期时间"
                              value-format="YYYY-MM-DD HH:mm:ss"></el-date-picker>
            </el-form-item>
            <el-form-item label="送货地址">
              <el-input v-model="order_form.send_address" readonly></el-input>
            </el-form-item>
            <el-form-item label="送货地址">
              <el-input v-model="order_form.arrive_address" readonly></el-input>
            </el-form-item>
            <el-form-item label="创建时间">
              <el-input v-model="order_form.order_create_date" readonly></el-input>
            </el-form-item>
            <el-form-item label="收件人员">
              <el-input v-model="order_form.order_arrive_username" readonly></el-input>
            </el-form-item>
            <el-form-item label="联系电话">
              <el-input v-model="order_form.order_arrive_usertel" readonly></el-input>
            </el-form-item>
            <el-form-item label="选择司机">
              <el-select style="margin-left: 5px" v-model="order_driver.driver_id" placeholder="请选择">
                <el-option
                    v-for="item in driver_list"
                    :key="item.driver_id"
                    :label="item.driver_name"
                    :value="item.driver_id">
                </el-option>
              </el-select>
            </el-form-item>
            <div style="border: 1px solid black; margin-bottom: 10px">
              <!-- 运单选择器 -->
              <div>
                <small style="color: #409EFF">收费规则：(吨,公里)</small>
                <div style="display: flex">
                  <div>
                    <span>每吨收费</span>
                    <el-input-number v-model="zl" controls-position="right" @change="handleChange1"
                                     :min="100"></el-input-number>
                  </div>
                  <div>
                    <span>每公里收费</span>
                    <el-input-number v-model="jl" controls-position="right" @change="handleChange2"
                                     :min="1"></el-input-number>
                  </div>
                </div>
              </div>

              <div>
                <small style="color: #409EFF">运费计算</small>
                <div>
                  <span>请输入货物重量：</span>
                  <el-input-number v-model="zhongliang" @change="handleChange4" :min="1"></el-input-number>
                </div>
                <div style="margin-top: 10px">
                  <span>请输入运输距离：</span>
                  <el-input-number v-model="juli" @change="handleChange3" :min="1"></el-input-number>
                </div>
                <p style="color: black">最低收费参考：<span style="color: gold">{{ heji }}</span></p>
              </div>
            </div>
            <el-form-item label="选择货车">
              <el-select style="margin-left: 5px" v-model="order_tran.tran_id" placeholder="请选择"
                         @change="getTran_money(order_tran.tran_id)">
                <el-option
                    v-for="item in tran_list"
                    :key="item.tran_id"
                    :label="item.tran_name"
                    :value="item.tran_id">
                </el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="运费总计">
              <el-input v-model="order_money" readonly></el-input>
            </el-form-item>
          </el-form>
        </div>

        <template #footer>
    <span class="dialog-footer">
      <el-button @click="close">取 消</el-button>

      <el-button type="primary" @click="updateOrder">确认订单</el-button>
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
      order_form: {},
      driver_list: [],
      tran_list: [],
      order_driver: {
        driver_id: ''
      },
      order_tran: {
        tran_id: '',
      },
      order_money: '',
      tran_money: '', //根据id获取到的工具价格
      jl: 2,
      zl: 100,
      juli: 1,
      zhongliang: 1,
      heji: 0,
    }
  },
  methods: {
    //读取列表数据
    load() {
      request.get('/api/OrderController/adminFindAllOrder', {
        params: {
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
    findOrderById(order_id) {
      this.dialogVisible = true
      this.findDriverFlagIs0()
      this.findTranFlagIs1()
      request.get('/api/OrderController/adminFindOrderContent', {
        params: {
          order_id: order_id
        }
      }).then(res => {
        this.order_form = res.data
      })
      this.load()
    },
    findDriverFlagIs0() {
      request.get('/api/OrderController/findDriverFlagIs0').then(res => {
        if (res.code == 0) {
          this.driver_list = res.data

        } else {
          ElMessage.error({
            message: res.message,
            type: 'error'
          });
        }
      })

    },
    findTranFlagIs1() {
      request.get('/api/OrderController/findTranFlagIs1').then(res => {
        if (res.code == 0) {
          this.tran_list = res.data
        } else {
          ElMessage.error({
            message: res.message,
            type: 'error'
          });
        }
      })
    },
    close() {
      this.dialogVisible = false
    },
    updateOrder() {
      this.order_form.order_driver = this.order_driver
      this.order_form.order_tran = this.order_tran
      this.order_form.order_money = this.order_money
      request.put('/api/OrderController/adminUpdateOrder', this.order_form).then(res => {
        if (res.code == 0) {
          this.dialogVisible = false
        } else {
          ElMessage.error({
            message: res.message,
            type: 'error'
          });
        }
      })
    },
    handleChange1() {
      this.jisuan()
    },
    handleChange2() {
      this.jisuan()
    },
    handleChange3() {
      this.jisuan()
    },
    handleChange4() {
      this.jisuan()
    },
    jisuan() {
      this.heji = this.juli * this.jl + this.zhongliang * this.zl
      this.total_money()
    },
    getTran_money(tran_id) { //根据id获取运输工具
      request.get('/api/TranController/findTranById', {
        params: {
          tran_id: tran_id
        }
      }).then(res => {
        this.tran_money = res.data.tran_money
        this.total_money()
      })

    },
    total_money() {  //计算出总价
      this.order_money = this.heji + this.tran_money
    }

  },
  created() {
    this.load()
  },

}
</script>

<style scoped>

</style>