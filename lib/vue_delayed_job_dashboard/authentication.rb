require "vue_delayed_job_dashboard/web/app"

VueDelayedJobDashboard::WebApplication.use Rack::Auth::Basic do |username, password|
  username == ENV["VUE_DELAYED_JOB_USERNAME"] && password == ENV["VUE_DELAYED_JOB_PASSWORD"]
end
