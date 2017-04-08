<template>
  <div>
    <el-table
      :data="jobs"
      style="width: 100%">
      <el-table-column
        prop="handler"
        label="Handler">
      </el-table-column>
      <el-table-column
        prop="priority"
        label="Priority">
      </el-table-column>
      <el-table-column
        prop="attempts"
        label="Attempts">
      </el-table-column>
      <el-table-column
        prop="run_at"
        label="Run at"
        width="180">
      </el-table-column>
      <el-table-column
        prop="locked_at"
        label="Locked at"
        width="180">
      </el-table-column>
      <el-table-column
        prop="created_at"
        label="Created at">
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        jobs: []
      }
    },
    created () {
      this.loadJobs()
    },
    methods: {
      loadJobs() {
        this.$http.get("/blah/jobs.json").then(response => {
          this.jobs = response.body;
        }, response => {
        });
      }
    }
  }
</script>
