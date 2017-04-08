<template>
  <el-row>
    <el-menu theme="dark" :default-active="activeIndex" class="el-menu-demo" mode="horizontal">
      <el-menu-item index="1">DELAYED JOB DASHBOARD</el-menu-item>
      <el-menu-item index="2"><a href="https://www.ele.me" target="_blank">Enqueued</a></el-menu-item>
      <el-menu-item index="3"><a href="https://www.ele.me" target="_blank">Working</a></el-menu-item>
      <el-menu-item index="4"><a href="https://www.ele.me" target="_blank">Pending</a></el-menu-item>
      <el-menu-item index="5"><a href="https://www.ele.me" target="_blank">Failed</a></el-menu-item>
    </el-menu>

    <el-col :span="24">
      <jobs-list></jobs-list>
    </el-col>
  </el-row>
</template>

<script>
import JobsList from './JobsList.vue'

export default {
  data () {
    return {
      activeIndex: '1'
    }
  },
  components: {
    jobsList: JobsList
  }
}
</script>

<style scoped>
a {
  text-decoration: none;
}
</style>
