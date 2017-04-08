<template>
  <div>
    <el-table
      :data="jobs"
      style="width: 100%">
      <el-table-column
        prop="id"
        label="Job ID">
      </el-table-column>
      <el-table-column
        prop="handler"
        label="Handler"
        :formatter="formatter"
        width="400">
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
        label="Run At"
        width="180"
        :formatter="runAtFormatter">
      </el-table-column>
      <el-table-column
        prop="created_at"
        label="Created At"
        :formatter="createdAtFormatter">
      </el-table-column>

      <el-table-column
        fixed="right"
        label="Actions"
        width="120">
        <template scope="scope">
          <el-button type="info" size="small" @click="dialogVisible = true">
            Show
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog title="Tips" v-model="dialogVisible" size="tiny">
      <span>This is a message</span>
      <span slot="footer" class="dialog-footer">
        <el-button @click="dialogVisible = false">Cancel</el-button>
        <el-button type="primary" @click="dialogVisible = false">Confirm</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
  const moment = require('moment');
  export default {
    data () {
      return {
        jobs: [],
        dialogVisible: false
      }
    },
    created () {
      this.loadJobs()
    },
    methods: {
      formatter(row, column){
        return row.handler.substring(0,300)
      },

      runAtFormatter(row, column){
        return moment(row.run_at).format('MMMM Do YYYY, h:mm:ss a');
      },

      createdAtFormatter(row, column){
        return moment(row.created_at).format('MMMM Do YYYY, h:mm:ss a');
      },

      loadJobs() {
        this.$http.get("/blah/jobs.json").then(response => {
          this.jobs = response.body;
        }, response => {
        });
      }
    }
  }
</script>
