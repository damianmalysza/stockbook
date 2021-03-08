# Stockbook - Sinatra project for Flatiron School #

Stockbook is a web application built using the Sinatra framework. The application allows a user to create watchlists, which are basically groupings of different stocks. A user can then view their watchlist and see how each stock of performing and get some basic data on each stock (current price, 52 week high, % change for day, etc.). They will also see how the watchlist performed overall for the day. 

## Usage

To install and use the application, you will need to do the following after cloning down:
* Run `bundle install`
* Run `rake db:create`
* Run `rake db:migrate`
* Configure the API - this app relies on IEX Cloud API to pull stock data. If you want to clone, you will need to produce and use your own API key and configure in this project as follows:
* Create a yaml config file titled 'api_key.yml' in root directory with the following format:
  * api_key: [YOUR TOKEN HERE]

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/damianmalysza/cocktail_cli. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/damianmalysza/stockbook/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Stockbook project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/damianmalysza/stockbook/blob/master/CODE_OF_CONDUCT.md).