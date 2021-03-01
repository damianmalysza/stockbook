require './config/environment'

use Rack::MethodOverride
use UsersController
use PortfoliosController
use StocksController
run ApplicationController