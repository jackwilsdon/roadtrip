Roadtrip::Application.routes.draw do
  get "/", to: "stream#index"
  get "/user/login", to: "user#login"
  post "/user/login", to: "user#login_attempt"
  resources :user, :trip, :stream
end
