<template>
  <el-row>
    <el-menu theme="dark" :default-active="activeIndex" class="el-menu-demo" mode="horizontal">
      <el-menu-item index="1"><a href="/delayed_job/overview">DELAYED JOB DASHBOARD</a></el-menu-item>
      <el-menu-item index="2"><a href="/delayed_job/enqueued">Enqueued</a></el-menu-item>
      <el-menu-item index="3"><a href="/delayed_job/working">Working</a></el-menu-item>
      <el-menu-item index="4"><a href="/delayed_job/pending">Pending</a></el-menu-item>
      <el-menu-item index="5"><a href="/delayed_job/failed">Failed</a></el-menu-item>
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

  created () {
    let path = window.location.pathname;
    if (path.includes("overview")) {
      this.activeIndex = '1'
    } else if (path.includes("enqueued")) {
      this.activeIndex = '2'
    } else if (path.includes("working")) {
      this.activeIndex = '3'
    } else if (path.includes("pending")) {
      this.activeIndex = '4'
    } else if (path.includes("failed")) {
      this.activeIndex = '5'
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
