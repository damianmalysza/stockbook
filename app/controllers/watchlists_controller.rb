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
    @watchlist = Watchlist.find(params[:id])
    # binding.pry
    erb :"/watchlists/show"
  end
  
  get "/watchlists/:id/edit" do
    @watchlist = Watchlist.find(params[:id])
    @addable_stocks = Stock.all.select {|stock| !@watchlist.stocks.include?(stock)}
    @removeable_stocks = @watchlist.stocks
    if @watchlist.user == current_user
      erb :"/watchlists/edit"
    else
      redirect '/'
    end
  end
  
  patch "/watchlists/:id" do
    watchlist = Watchlist.find(params[:id])
    params[:stock_additions] = [] unless params[:stock_additions]
    if !params[:new_stock].empty?
      new_stock_ticker = params[:new_stock].upcase
      if Stock.valid_ticker?(new_stock_ticker)
        if Stock.find_by(ticker: new_stock_ticker)
          params[:stock_additions] << new_stock_ticker
        else
          Stock.create_new_stock(new_stock_ticker)
          params[:stock_additions] << new_stock_ticker
        end
      else
        flash[:message] = "Invalid ticker - please enter a valid ticker"
        redirect "/watchlists/#{params[:id]}/edit"
      end
    end

    if params[:stock_additions].length != 0
      params[:stock_additions].uniq.each do |stock|
        stock_to_add = Stock.find_by(ticker:stock)
        watchlist.stocks << stock_to_add
      end
    end
    
    if params[:stock_removals]
      params[:stock_removals].each do |stock|
        stock = Stock.find_by(ticker:stock)
        stock_to_remove = StockWatchlist.where(watchlist_id:watchlist.id,stock_id: stock.id) 
        StockWatchlist.delete(stock_to_remove.ids.first)
      end
    end
    
    watchlist.save
    
    redirect "/watchlists/#{params[:id]}"
  end
  
  get "/watchlists/:id/delete" do
    watchlist = Watchlist.find(params[:id])
    if logged_in? && current_user.id == watchlist.user.id
      watchlist.delete
      redirect "/watchlists"
    else
      redirect "/watchlists"
    end
  end
end
