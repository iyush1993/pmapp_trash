Rails.application.routes.draw do
  
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
