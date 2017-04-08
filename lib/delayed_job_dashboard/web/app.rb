require 'sinatra/base'

module DelayedJobDashboard
  class WebApplication < Sinatra::Base
    set :root, File.dirname(__FILE__)
    set :static, true
    set :public_folder, File.expand_path('../public', __FILE__)
    set :views, File.expand_path('../views', __FILE__)

    get "/" do
      "Hello Sinatra World"
    end

    get '/overview' do
      if defined?(Delayed::Job)
        haml :overview, escape_html: false
      else
        @message = "Delayed::Job is not available"
        haml :error
      end
    end

    get '/jobs.json' do
      content_type :json
      @jobs = Delayed::Job.all.map do |job|
        {
          handler: job.handler.truncate(200),
          priority: job.priority,
          attempts: job.attempts,
          run_at: job.run_at,
          locked_at: job.locked_at,
          created_at: job.created_at
        }
      end
      @jobs.to_json
    end
  end
end
