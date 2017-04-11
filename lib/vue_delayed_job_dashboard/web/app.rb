require 'sinatra/base'
require 'vue_delayed_job_dashboard/web/filter'

module VueDelayedJobDashboard
  class WebApplication < Sinatra::Base
    set :root, File.dirname(__FILE__)
    set :static, true
    set :public_folder, File.expand_path('../public', __FILE__)
    set :views, File.expand_path('../views', __FILE__)

    get "/" do
      redirect "/delayed_job/overview"
    end

    get '/overview' do
      if defined?(Delayed::Job)
        haml :overview, escape_html: false
      else
        @message = "Delayed::Job is not available"
        haml :error
      end
    end

    get '/enqueued' do
      haml :enqueued, escape_html: false
    end

    get '/pending' do
      haml :pending, escape_html: false
    end

    get '/failed' do
      haml :failed, escape_html: false
    end

    get '/working' do
      haml :working, escape_html: false
    end

    get '/jobs_info.json' do
      content_type :json
      total = VueDelayedJobDashboard::Filter.for(Delayed::Job, params[:filter]).page(0).per(params[:per_page]).total_pages

      {
        total_jobs: VueDelayedJobDashboard::Filter.for(Delayed::Job, params[:filter]).count,
        total_pages: total
      }.to_json
    end

    get '/jobs.json' do
      content_type :json

      @jobs = Delayed::Job.page(params[:page]).per(params[:per_page]).order(created_at: :desc)
      @jobs = VueDelayedJobDashboard::Filter.for(@jobs, params[:filter])

      @jobs_json = @jobs.as_json
      @jobs_json.each_with_index do |job, index|
        job["payload_object"] = @jobs[index].payload_object
      end
      @jobs_json.to_json
    end
  end
end
