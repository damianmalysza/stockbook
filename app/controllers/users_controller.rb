class UsersController < ApplicationController

  get '/signup' do
    
  end

  post '/signup' do
    
  end

  get '/login' do
    
  end

  post '/login' do
    
  end

  get '/logout' do
    
  end

  get "/users/:username" do
    erb :"/users/show.html"
  end

  get "/users/:username/edit" do
    erb :"/users/edit.html"
  end

  patch "/users/:username" do
    redirect "/users/:id"
  end

  delete "/users/:id/delete" do
    redirect "/users"
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
