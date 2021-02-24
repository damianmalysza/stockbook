class StocksController < ApplicationController

  # GET: /stocks
  get "/stocks" do
    erb :"/stocks/index.html"
  end

  # GET: /stocks/new
  get "/stocks/new" do
    erb :"/stocks/new.html"
  end

  # POST: /stocks
  post "/stocks" do
    redirect "/stocks"
  end

  # GET: /stocks/5
  get "/stocks/:id" do
    erb :"/stocks/show.html"
  end

  # GET: /stocks/5/edit
  get "/stocks/:id/edit" do
    erb :"/stocks/edit.html"
  end

  # PATCH: /stocks/5
  patch "/stocks/:id" do
    redirect "/stocks/:id"
  end

  # DELETE: /stocks/5/delete
  delete "/stocks/:id/delete" do
    redirect "/stocks"
  end
end
