require './config/environment'

use Rack::MethodOverride
use UsersController
use WatchlistsController
use StocksController
run ApplicationController