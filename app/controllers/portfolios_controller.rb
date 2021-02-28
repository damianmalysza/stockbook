class PortfoliosController < ApplicationController

  # GET: /portfolios
  get "/portfolios" do
    @portfolios = Portfolio.all
    erb :"/portfolios/index.html"
  end

  # GET: /portfolios/new
  get "/portfolios/new" do
    erb :"/portfolios/new.html"
  end

  # POST: /portfolios
  post "/portfolios" do
    redirect "/portfolios"
  end

  # GET: /portfolios/5
  get "/portfolios/:id" do
    erb :"/portfolios/show.html"
  end

  # GET: /portfolios/5/edit
  get "/portfolios/:id/edit" do
    erb :"/portfolios/edit.html"
  end

  # PATCH: /portfolios/5
  patch "/portfolios/:id" do
    redirect "/portfolios/:id"
  end

  # DELETE: /portfolios/5/delete
  delete "/portfolios/:id/delete" do
    redirect "/portfolios"
  end
end
