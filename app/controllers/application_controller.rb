require './config/environment'

class ApplicationController < Sinatra::Base
  @@api_key = YAML.load_file('./api_key.yml')["api_key"]
  #api_key loaded above but this should really go into a class used to do the web scraping - should move eventually

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

end
