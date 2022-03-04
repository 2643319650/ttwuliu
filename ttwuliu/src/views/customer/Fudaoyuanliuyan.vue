<template>
  <div style="display: flex;justify-content: center;align-items: center">
    <div style="width: 500px;margin-top: 10px">
      <el-form ref="customer_addform" :model="customer_addform" label-width="90px">
        <el-form-item label="订单号">
          <el-input v-model="customer_addform.order_no" readonly></el-input>
        </el-form-item>
        <el-form-item label="发货地址">
          <el-input id="text_" v-model="customer_addform.send_address" name="address" v-on:blur="searchByStationName();"></el-input>
        </el-form-item>
        <div id="container"></div>
        <el-form-item label="收货地址" style="margin-top: 20px">
          <el-input id="text_2" v-model="customer_addform.arrive_address" name="address" v-on:blur="searchByStationName2();"></el-input>
        </el-form-item>
        <div id="container2"></div>
        <el-form-item label="收件人姓名" style="margin-top: 20px">
          <el-input v-model="customer_addform.order_arrive_username"></el-input>
        </el-form-item>
        <el-form-item label="收件人电话">
          <el-input v-model="customer_addform.order_arrive_usertel"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="save_customer_addform">立即下单</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
  import request from "../../utils/request";
  import {ElMessage} from 'element-plus'

  export default {
    name: "CustomerBuyOrder",
    data() {
      return {
        customer12: JSON.parse(sessionStorage.getItem("customer")),
        customer_addform: {},
        location1: [
          lng => '',
          lat => ''
        ],
        location2: [
          lng => '',
          lat => ''
        ],
      }
    },
    mounted:function(){
      this.setmap()
      this.setmap2()
    },
    methods: {
      save_customer_addform() {
        request.post('/api/OrderController/customerAddOrder', this.customer_addform).then(res => {
          if (res.code == 0) {
            ElMessage.success({
              message: res.message,
              type: 'success'
            });
            this.customer_addform = {
              order_no: '',
            }
            this.$router.push('/customerLayout/customerFindOrder')
          } else {
            ElMessage.error({
              message: res.message,
              type: 'error'
            });
          }
        })
      },
      load() {
        request.get('/api/OrderController/createOrderId', {}).then(res => {
          this.customer_addform.order_no = res.message
        })
      },
      jz() {
        this.customer12.customer_id
      },
      /*findDriverFlagIs0() {
        this.dialogVisible = true
        request.get('/api/OrderController/findDriverFlagIs0').then(res => {
          if (res.code == 0) {
            this.driverList = res.data

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
            this.tranList = res.data

          } else {
            ElMessage.error({
              message: res.message,
              type: 'error'
            });
          }
        })
      }*/
      //显示地图
      setmap: function() {
        var map = new BMap.Map('container', {
          enableMapClick: true
        }); // 创建Map实例
        map.centerAndZoom(new BMap.Point(116.413387, 39.910924), 11); // 初始化地图,设置中心点坐标和地图级别
        //添加地图类型控件
        map.addControl(new BMap.MapTypeControl({
          mapTypes: [
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
          ]
        }));
        map.setCurrentCity("北京"); // 设置地图显示的城市 此项是必须设置的
        map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
        const _this = this
        map.addEventListener('click', function(e) {
          _this.location1.lng = parseFloat(e.point.lng).toFixed(3)
          _this.location1.lat = parseFloat(e.point.lat).toFixed(3)
          /*alert(_this.location1.lng + "," + _this.location1.lat);*/
        })
      },
      searchByStationName: function() {
        var map = new BMap.Map('container', {
          enableMapClick: true
        }); // 创建Map实例
        map.clearOverlays(); //清空原来的标注
        var localSearch = new BMap.LocalSearch(map);
        localSearch.enableAutoViewport(); //允许自动调节窗体大小
        var keyword = document.getElementById("text_").value;
        localSearch.setSearchCompleteCallback(function(searchResult) {
          var poi = searchResult.getPoi(0);
          // alert(poi.address);
          //document.getElementById("result_").value = poi.point.lng + "," + poi.point.lat;
          map.centerAndZoom(poi.point, 13);
          var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat)); // 创建标注，为要查询的地方对应的经纬度
          map.addOverlay(marker);
          document.getElementById("lngs").value = poi.point.lng;
          document.getElementById("lats").value = poi.point.lat;
          marker.addEventListener("click", function() {
            this.openInfoWindow(infoWindow);
          });
          marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
        });
        localSearch.search(keyword);
      },
      setmap2: function() {
        var map = new BMap.Map('container2', {
          enableMapClick: true
        }); // 创建Map实例
        map.centerAndZoom(new BMap.Point(116.413387, 39.910924), 11); // 初始化地图,设置中心点坐标和地图级别
        //添加地图类型控件
        map.addControl(new BMap.MapTypeControl({
          mapTypes: [
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
          ]
        }));
        map.setCurrentCity("北京"); // 设置地图显示的城市 此项是必须设置的
        map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
        const _this = this
        map.addEventListener('click', function(e) {
          _this.location2.lng = parseFloat(e.point.lng).toFixed(3)
          _this.location2.lat = parseFloat(e.point.lat).toFixed(3)
          /*alert(_this.location2.lng + "," + _this.location2.lat);*/
        })
      },
      searchByStationName2: function() {
        var map = new BMap.Map('container2', {
          enableMapClick: true
        }); // 创建Map实例
        map.clearOverlays(); //清空原来的标注
        var localSearch = new BMap.LocalSearch(map);
        localSearch.enableAutoViewport(); //允许自动调节窗体大小
        var keyword = document.getElementById("text_2").value;
        localSearch.setSearchCompleteCallback(function(searchResult) {
          var poi = searchResult.getPoi(0);
          // alert(poi.address);
          //document.getElementById("result_").value = poi.point.lng + "," + poi.point.lat;
          map.centerAndZoom(poi.point, 13);
          var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat)); // 创建标注，为要查询的地方对应的经纬度
          map.addOverlay(marker);
          document.getElementById("lngs2").value = poi.point.lng;
          document.getElementById("lats2").value = poi.point.lat;
          marker.addEventListener("click", function() {
            this.openInfoWindow(infoWindow);
          });
          marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
        });
        localSearch.search(keyword);
      },
    },
    created() {
      this.load()
      this.jz()
      this.customer_addform = {
        order_no: '',
        order_customer:{
          customer_id:this.customer12.customer_id
        }
      }
      console.log(this.customer_addform)
    }
  }
</script>

<style scoped>
#text_ {
  margin-right: 100px;
}
#container {
  width: 600px;
  height: 200px;
  border: 1px solid gray;
  overflow: hidden;
}

#text_2 {
  margin-right: 100px;
}

#container2 {
  width: 600px;
  height: 200px;
  border: 1px solid gray;
  overflow: hidden;
}
</style>