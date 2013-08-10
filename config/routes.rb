Roadtrip::Application.routes.draw do
  get "/", to: "stream#index"

  get "/user/login", to: "user#login"
  post "/user/login", to: "user#login_attempt"

  get "/user/logout", to: "user#logout"

  get "/user/:id", to: "user#show"

  get "/trip/list", to: "trip#list"
  get "/trip/new", to: "trip#new"
  post "/trip/new", to: "trip#new_submit"
  get "/trip/edit", to: "trip#edit"
  get "/trip/:id", to: "trip#show"
  resources :user, :trip
end
