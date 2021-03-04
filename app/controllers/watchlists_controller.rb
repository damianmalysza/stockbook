class WatchlistsController < ApplicationController

  get "/watchlists" do
    @watchlists = Watchlist.all
    erb :"/watchlists/index"
  end

  get "/watchlists/new" do
    erb :"/watchlists/new"
  end

  post "/watchlists" do
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
