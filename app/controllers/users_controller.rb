require 'rack-flash'

class UsersController < ApplicationController
  
  get '/signup' do
    if logged_in?
      redirect "/users/#{current_user.username}"
    else
      erb :"users/signup"
    end
  end
  
  post '/signup' do
    if User.find_by(username: params[:username])
      flash[:message] = "Username already taken - please use another one"
      redirect '/signup'
    else
      User.create(params)
      session[:username] = params[:username]
      redirect "/users/#{current_user.username}"
    end
  end
  
  get '/login' do
    if logged_in?
      redirect "/users/#{current_user.username}"
    else
      erb :"users/login"
    end
  end
  
  post '/login' do
    user = User.find_by(username: params[:username])
    
    if user && user.authenticate(params[:password])
      session[:username] = user.username
      redirect "/users/#{user.username}"
    else
      flash[:message] = "Username or password incorrect - please try again"
      redirect '/login'
    end
  end
  
  get '/logout' do
    session.clear if logged_in?
    redirect '/'
  end
  
  get "/users/:username" do
    @user = User.find_by(username:params[:username])
    if @user
      erb :"/users/show"
    else 
      redirect '/'
    end
  end
  
  get "/users/:username/edit" do
    @user = User.find_by(username:params[:username])
    if @user && @user == current_user
      erb :"/users/edit"
    else
      redirect '/'
    end
  end
  
  patch "/users/:username" do
    if params[:updated_username] == current_user.username
      flash[:message] = "Username entered is the same - no updates made"
      redirect "/users/#{current_user.username}/edit"
    elsif User.find_by(username: params[:updated_username])
      flash[:message] = "Username already taken - please use another one"
      redirect "/users/#{current_user.username}/edit"
    else
      user = User.find_by(username:params[:username])
      user.update(username:params[:updated_username])
      session[:username] = user.username
      redirect "/users/#{user.username}"
    end 
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
