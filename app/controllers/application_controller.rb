class ApplicationController < ActionController::Base
    def home
        @btcusdt = Binance::Api.ticker!(symbol: 'BTCUSDT', type: :daily)
        @ethusdt = Binance::Api.ticker!(symbol: 'ETHUSDT', type: :daily)
    end

    def home2
        on_open = ->(event) { puts '>> Websocket opened' }
        on_close = ->(event) { puts ">> Websocket closed (#{event.code}): #{event.reason}" }
        EM.run do
        websocket = Binance::WebSocket.new(on_open: on_open, on_close: on_close)

        websocket.candlesticks!(%w[BTCUSDT], '1m') do |stream_name, kline_candlestick|
            symbol = kline_candlestick[:s]
            price = kline_candlestick[:p]
            puts symbol
            puts stream_name
            print kline_candlestick
        end
        end
        print Binance::Api.ping!
    end
end
