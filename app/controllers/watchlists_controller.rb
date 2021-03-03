class WatchlistsController < ApplicationController

  # GET: /watchlists
  get "/watchlists" do
    @watchlists = Watchlist.all
    erb :"/watchlists/index"
  end

  # GET: /watchlists/new
  get "/watchlists/new" do
    erb :"/watchlists/new"
  end

  # POST: /watchlists
  post "/watchlists" do
    redirect "/watchlists"
  end

  # GET: /watchlists/5
  get "/watchlists/:id" do
    erb :"/watchlists/show"
  end

  # GET: /watchlists/5/edit
  get "/watchlists/:id/edit" do
    erb :"/watchlists/edit"
  end

  # PATCH: /watchlists/5
  patch "/watchlists/:id" do
    redirect "/watchlists/:id"
  end

  # DELETE: /watchlists/5/delete
  delete "/watchlists/:id/delete" do
    redirect "/watchlists"
  end
end
