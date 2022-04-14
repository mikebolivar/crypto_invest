Rails.application.routes.draw do
  get '/currency/price/:symbol', to: 'currency#price'
  post '/report', to: 'application#report'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "application#home"
  post '/', to: "application#home"
end
