<template>
<div>
<!-- 运单选择器 -->
  <div>
    <h2>收费规则：(吨,公里)</h2>
    <div style="display: flex">
      <div>
        每吨收费：
        <el-input-number v-model="zl" controls-position="right" @change="handleChange1" :min="100"></el-input-number>
      </div>
      <div>
        每公里收费：
        <el-input-number v-model="jl" controls-position="right" @change="handleChange2" :min="1"></el-input-number>
      </div>
    </div>
  </div>

  <div>
    <h2>运费计算：</h2>
    <div>
      <span>请输入货物重量：</span>
      <el-input-number v-model="zhongliang" @change="handleChange4" :min="1"></el-input-number>
    </div>
    <div>
      <span>请输入运输距离：</span>
      <el-input-number v-model="juli" @change="handleChange3" :min="1"></el-input-number>
    </div>
<!--    <div style="display:flex;">-->
<!--      <el-button type="success" icon="el-icon-check" v-on:click="jisuan" circle></el-button>-->
<!--      <el-input v-model="heji" placeholder="最低收费参考" readonly></el-input>-->
<!--    </div>-->
    <h3>最低收费参考：<span style="color: gold">{{heji}}</span></h3>
  </div>
</div>
</template>

<script>
export default {
  name: "PayMoney",
  data(){
    return{
      jl:2,
      zl:100,
      juli:1,
      zhongliang:1,
      heji:0,
    }
  },
  methods:{
    handleChange1(){
      this.jisuan()
    },
    handleChange2(){
      this.jisuan()
    },
    handleChange3(){
      this.jisuan()
    },
    handleChange4(){
      this.jisuan()
    },
    jisuan(){
      this.heji=this.juli*this.jl+this.zhongliang*this.zl
    },
  },

}
</script>

<style scoped>

</style>