class ApplicationController < ActionController::Base
    def home
        self.binance
    end

    def report
        self.binance
        csv_string = CSV.generate do |csv|
            cols1 = ["BTC", @btcusdt[:lastPrice]]
            cols2 = ["ETH", @ethusdt[:lastPrice]]
            cols3 = ["Tabla BTC", "", "", "", "TABLA ETH"]
            cols = ["Mes", "USD", "BTC", "","Mes", "USD", "ETH"]
            csv << cols1
            csv << cols2
            csv << cols3
            csv << cols
            usdBtc = params[:amount]
            usdEth = params[:amount]
            
            for a in 1..12 do
                usdBtc = usdBtc.to_f * 1.05 
                usdEth = usdEth.to_f * 1.03
                puts usdBtc
                
                puts a
                csv << [a, usdBtc, usdBtc.to_f / @btcusdt[:lastPrice].to_f, "", a, usdEth, usdEth.to_f / @ethusdt[:lastPrice].to_f]
                 
            end
          
            @filename = "data-#{Time.now.to_date.to_s}.csv"  
          end
        send_data(csv_string, :type => 'text/csv; charset=utf-8; header=present', :filename => @filename)  
    end

    def binance
        @btcusdt = Binance::Api.ticker!(symbol: 'BTCUSDT', type: :daily)
        @ethusdt = Binance::Api.ticker!(symbol: 'ETHUSDT', type: :daily)
    end
end
