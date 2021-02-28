class UsersController < ApplicationController

  get '/signup' do
    
  end

  get '/login' do
    
  end

  post "/users" do
    redirect "/users"
  end

  get "/users/:id" do
    erb :"/users/show.html"
  end

  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  patch "/users/:id" do
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
