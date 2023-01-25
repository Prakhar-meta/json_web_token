Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :authentication_block do 
    resources :users
    post "/login" , to: "users#login"
  end
end
