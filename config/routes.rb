Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  #The option 'defaults: {format: :json } will set json as the default response 
  #format for all routes contained within the block
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :games, only: [:create, :index, :show, :destroy] do
      get :user_index, on: :collection
      end
      resources :posts, only: [:create, :index, :show, :destroy]
      resource :session, only: [:create, :destroy]
      resources :users, only: [:create, :index, :show, :update] do
        # get('users/current', {to: 'users#current'})
        get :current, on: :collection #api/v1/users/current
      end
    end
  end
end
