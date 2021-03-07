class WatchlistsController < ApplicationController
  
  get "/watchlists" do
    @users = User.all.sort_by {|user| user.username}
    erb :"/watchlists/index"
  end
  
  get "/watchlists/new" do
    if logged_in?
      Stock.all.empty? ? (@stocks = []) : (@stocks = Stock.all.sort_by {|stock| stock.ticker.downcase})
      erb :"/watchlists/new"
    else
      redirect '/'
    end
  end
  
  post "/watchlists" do
    # binding.pry
    if !params[:stock][:new_stock].empty?
      new_stock_ticker = params[:stock][:new_stock].upcase
      if Stock.valid_ticker?(new_stock_ticker)
        if Stock.find_by(ticker: new_stock_ticker)
          params[:watchlist][:stocks] << new_stock_ticker
        else
          Stock.create_new_stock(new_stock_ticker)
          params[:watchlist][:stocks] << new_stock_ticker
        end
      else
        flash[:message] = "Invalid ticker - please enter a valid ticker"
        redirect '/watchlists/new'
      end
    end
    # binding.pry
    watchlist = Watchlist.create(name:params[:watchlist][:name])

    if params[:watchlist][:stocks]

      stocks = params[:watchlist][:stocks]
      stocks.each do |ticker|
        stock = Stock.find_by(ticker:ticker.upcase)
        watchlist.stocks << stock unless watchlist.stocks.include?(stock)
        watchlist.save
      end
    end
    current_user.watchlists << watchlist
    current_user.save
  
    redirect "/users/#{current_user.username}"
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
