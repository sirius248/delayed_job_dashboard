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
      @jobs = Delayed::Job.all
      @jobs.to_json
    end
  end
end
