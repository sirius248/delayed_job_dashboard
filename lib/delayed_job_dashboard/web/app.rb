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
        haml :overview, format: :html5
      else
        @message = "Unable to connected to Delayed::Job database"
        haml :error
      end
    end
  end
end
