Rails.application.routes.draw do

  namespace :v1 do 
    
    resources :projects, only: [:create, :show, :update, :destroy] do
      resources :contents, only: [:index, :create, :show]
      collection do
        get :my_projects
      end
    end
    
    resources :contents, only: [:update, :destroy]

    match '/projects', to: 'projects#index', via: [:get, :post]

    post "/users/signup", to: "users#create"
    post "/auth/signin", to: "users#login"
  end

end
