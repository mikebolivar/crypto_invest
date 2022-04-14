class ApplicationController < ActionController::Base
    def home
        self.binance
        if request.POST.include? "amount"
            @amount = params[:amount]
        end
    end

    def report
        self.binance
        csv_string = CSV.generate do |csv|
            cols0 = ["Monto", params[:amount]]
            cols1 = ["BTC", @btcusdt[:lastPrice]]
            cols2 = ["ETH", @ethusdt[:lastPrice]]
            cols3 = ["Tabla BTC", "", "", "", "TABLA ETH"]
            cols = ["Mes", "USD", "BTC", "","Mes", "USD", "ETH"]
            csv << cols0
            csv << cols1
            csv << cols2
            csv << cols3
            csv << cols
            usdBtc = params[:amount]
            usdEth = params[:amount]
            
            for a in 1..12 do
                usdBtc = usdBtc.to_f * (1 + @btc_int) 
                usdEth = usdEth.to_f * (1 + @eth_int)
                puts usdBtc
                
                puts a
                csv << [a, usdBtc, usdBtc.to_f / @btcusdt[:lastPrice].to_f, "", a, usdEth, usdEth.to_f / @ethusdt[:lastPrice].to_f]
                 
            end
          
            @filename = "data-#{Time.now.to_date.to_s}.csv"  
          end
        send_data(csv_string, :type => 'text/csv; charset=utf-8; header=present', :filename => @filename)  
    end

    def binance
        @btc_int = 0.05
        @eth_int = 0.03
        @btcusdt = Binance::Api.ticker!(symbol: 'BTCUSDT', type: :daily)
        @ethusdt = Binance::Api.ticker!(symbol: 'ETHUSDT', type: :daily)
    end
end
