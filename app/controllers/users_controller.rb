require 'rack-flash'

class UsersController < ApplicationController
  
  get '/signup' do
    if logged_in?
      redirect '/' #TODO - change this to render the portfolio view page for the user once that gets coded
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
      redirect '/' #TODO - change this to render the portfolio view page for the user once that gets coded
    end
  end
  
  get '/login' do
    if logged_in?
      redirect '/'
    else
      erb :"users/login"
    end
  end
  
  post '/login' do
    user = User.find_by(username: params[:username])
    
    if user && user.authenticate(params[:password])
      session[:username] = user.username
      redirect '/' #TODO - change this to render the portfolio view page for the user that gets coded
    else
      flash[:message] = "Username or password incorrect - please try again"
      redirect '/login'
    end
  end
  
  get '/logout' do
    session.clear
    redirect '/'
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
