class WatchlistsController < ApplicationController
  
  get "/watchlists" do
    @watchlists = Watchlist.all
    erb :"/watchlists/index"
  end
  
  get "/watchlists/new" do
    if logged_in?
      erb :"/watchlists/new"
    else
      redirect '/'
    end
  end
  
  post "/watchlists" do
    binding.pry
    # check if new stock was entered
    # if new stock was entered, check if ticker is valid
    # if ticker isn't valid, create flash message, redirect user to new watchlist page
    # if ticket is valid, create a new stock with that ticker

    # create a new watchlist with the entered name
    # add watchlist to the current_users's array of watchlists
    # add selected stocks to watchlist's array of stocks
    # save watchlist
    # redirect user to user's profile page
    redirect "/watchlists"
  end
  
  get "/watchlists/:id" do
    erb :"/watchlists/show"
  end
  
  get "/watchlists/:id/edit" do
    erb :"/watchlists/edit"
  end
  
  patch "/watchlists/:id" do
    redirect "/watchlists/:id"
  end
  
  delete "/watchlists/:id/delete" do
    redirect "/watchlists"
  end
end
