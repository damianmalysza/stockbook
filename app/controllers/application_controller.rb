require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
 
  configure do
    enable :sessions
    set :session_secret, "diamond_hands"
    use Rack::Flash
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      User.find_by(username:session[:username])
    end
    
    def logged_in? 
      !!session[:username]
    end
  end
end
