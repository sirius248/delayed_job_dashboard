<template>
  <!-- <div id="app"> -->
    <el-row>
        <el-menu theme="dark" :default-active="activeIndex" class="el-menu-demo" mode="horizontal" @select="handleSelect">
        <el-menu-item index="1">Dashboard</el-menu-item>
        <el-menu-item index="2"><a href="https://www.ele.me" target="_blank">Enqueued</a></el-menu-item>
        <el-menu-item index="3"><a href="https://www.ele.me" target="_blank">Working</a></el-menu-item>
        <el-menu-item index="4"><a href="https://www.ele.me" target="_blank">Pending</a></el-menu-item>
        <el-menu-item index="5"><a href="https://www.ele.me" target="_blank">Failed</a></el-menu-item>
      </el-menu>
      <el-col :span="24">
        <h1>{{ msg }}</h1>
        <jobs-list></jobs-list>
      </el-col>
    </el-row>
  <!-- </div> -->
</template>

<script>
import JobsList from './JobsList.vue'

export default {
  name: 'app',
  data () {
    return {
      msg: 'Dashboard',
      activeIndex: '1'
    }
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(key, keyPath);
    }
  },
  components: {
    jobsList: JobsList
  }
}
</script>

<style >
#main {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
h1, h2 {
  font-weight: normal;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
  text-decoration: none;
}
</style>
