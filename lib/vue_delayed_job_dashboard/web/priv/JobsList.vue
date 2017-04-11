<template>
  <div>
    <div class="block">
      <el-pagination
        layout="total, sizes, prev, pager, next"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :page-sizes="pageSizes"
        :page-size="perPage"
        :total="totalJobs">
      </el-pagination>
    </div>

    <el-table
      :data="jobs"
      v-loading.body="loading"
      style="width: 100%">
      <el-table-column
        prop="id"
        label="Job ID">
      </el-table-column>
      <el-table-column
        label="Status">
        <template scope="scope">
          <el-tag
            :type="filterTag(scope.row)">{{filterTagName(scope.row)}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        prop="payload_object"
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
        label="Actions"
        width="120">
        <template scope="scope">
          <el-button type="info" size="mini" @click.native.prevent="handleClickDialog(scope.$index, jobs)">
            Show
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <div class="block">
      <el-pagination
        layout="total, sizes, prev, pager, next"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :page-sizes="pageSizes"
        :page-size="perPage"
        :total="totalJobs">
      </el-pagination>
    </div>

    <el-dialog title="Object Payload" v-model="dialogVisible" size="small">
      <pre>{{jobDetailHandler}}</pre>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogVisible = false">Ok!</el-button>
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
        dialogVisible: false,
        jobDetailHandler: "",
        jobDetailId: "",
        loading: true,
        currentPage: 0,
        perPage: 4,
        totalJobs: 0,
        totalPages: 0,
        pageSizes: [4, 6, 8, 10]
      }
    },

    created () {
      this.loadPageInfo();
      this.loadJobsForCurrentPage();
    },

    methods: {
      getJobType() {
        const path = window.location.pathname;
        if (path.includes("pending")) {
          return "pending"
        } else if (path.includes("failed")) {
          return "failed"
        } else if (path.includes("working")) {
          return "working"
        } else if (path.includes("enqueued")) {
          return "enqueued"
        }
        else {
          return ""
        }
      },

      loadJobsForCurrentPage() {
        const filter = this.getJobType();
        this.loadJobs({
          params: {
            filter: filter,
            page: this.currentPage,
            per_page: this.perPage
          }
        });
      },

      loadPageInfo(){
        const queries = { params: { filter: this.getJobType(), r_page: this.perPage } };
        this.$http.get("/delayed_job/jobs_info.json", queries).then(response => {
          const res = response.body;
          this.totalPages = res.total_pages;
          this.totalJobs = res.total_jobs;
        }, response => {
        });
      },

      handleSizeChange(val){
        this.perPage = val;
        this.loadPageInfo();
        this.loadJobsForCurrentPage();
      },

      handleCurrentChange(val) {
        this.currentPage = val;
        this.loadJobsForCurrentPage();
      },

      handleClickDialog(index, jobs){
        this.jobDetailHandler = jobs[index].payload_object;
        this.jobDetailId = jobs[index].id;
        this.dialogVisible = true;
      },

      formatter(row, column){
        return row.handler.substring(0,300)
      },

      filterTag(row){
        if (row.failed_at !== null) {
          return "danger"
        } else if (row.locked_at !== null) {
          return "warning"
        } else {
          return "gray"
        }
      },

      filterTagName(row) {
        if (row.failed_at !== null) {
          return "Failed"
        } else if (row.locked_at !== null) {
          return "Running"
        } else {
          return "Queued"
        }
      },

      runAtFormatter(row, column){
        return moment(row.run_at).format('MMMM Do YYYY, h:mm:ss a');
      },

      createdAtFormatter(row, column){
        return moment(row.created_at).format('MMMM Do YYYY, h:mm:ss a');
      },

      loadJobs(queries) {
        this.$http.get("/delayed_job/jobs.json", queries).then(response => {
          this.jobs = response.body;
          this.loading = false;
        }, response => {
          this.loading = false;
        });
      }
    }
  }
</script>
