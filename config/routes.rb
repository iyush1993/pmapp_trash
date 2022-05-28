Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  namespace :v1 do 
    post "/users/signup", to: "users#create"
    post "/auth/signin", to: "users#login"
  end

end
