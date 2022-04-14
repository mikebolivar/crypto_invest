class CurrencyController < ApplicationController
  def price
    # BTCUSDT o ETHUSDT agregar validacion
    symbol = params[:symbol]
    ticker = Binance::Api.ticker!(symbol: symbol, type: :daily)
    render :json => ticker
  end
end
