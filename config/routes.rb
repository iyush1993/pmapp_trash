Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  namespace :v1 do 

    resources :projects, only: [:create, :show, :update, :destroy] do
      resources :contents, only: [:index, :create, :show, :update, :destroy]
      collection do
        get :my_projects
      end
    end

    match '/projects', to: 'projects#index', via: [:get, :post]

    post "/users/signup", to: "users#create"
    post "/auth/signin", to: "users#login"
  end

end
