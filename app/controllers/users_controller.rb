require 'rack-flash'

class UsersController < ApplicationController

  get '/signup' do
    erb :"users/signup"
  end

  post '/signup' do
    if User.find_by(username: params[:username])
      flash[:message] = "Username already taken - please use another one"
      redirect '/signup'
    else
      User.create(params)
      redirect '/' #TODO - change this to render the portfolio view page for the user once that gets coded
    end
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

  delete "/users/:username/delete" do
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
