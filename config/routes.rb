Roadtrip::Application.routes.draw do
  get "/", to: "stream#index"

  get "/user/login", to: "user#login"
  post "/user/login", to: "user#login_attempt"

  get "/user/logout", to: "user#logout"

  get "/user/:id", to: "user#show"

  get "/trip/list", to: "trip#list"
  get "/trip/:id", to: "trip#show"
  resources :user, :trip
end
