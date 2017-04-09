require 'sinatra/base'

module DelayedJobDashboard
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

    get '/jobs.json' do
      content_type :json

      case params["filter"]
      when "pending"
        @jobs = Delayed::Job.where(locked_at: nil, attempts: 0).order(created_at: :desc)
      when "failed"
        @jobs = Delayed::Job.where.not(failed_at: nil).order(created_at: :desc)
      when "working"
        @jobs = Delayed::Job.where.not(locked_at: nil).order(created_at: :desc)
      when "enqueued"
        @jobs = Delayed::Job.order(created_at: :desc)
      end

      @jobs = Delayed::Job.order(created_at: :desc) if @jobs.nil?

      @jobs_json = @jobs.as_json
      @jobs_json.each_with_index do |job, index|
        job["payload_object"] = @jobs[index].payload_object
      end
      @jobs_json.to_json
    end
  end
end
