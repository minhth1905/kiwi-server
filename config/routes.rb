Rails.application.routes.draw do

  root "static_pages#home"
  devise_for :users, :skip => :sessions, :controllers => {:passwords => 'api/v1/users/passwords'}
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "sign_in", :to => 'sessions#create'
      get "/portfolio/:id/rates", :to => "portfolios#rate"
      get "/portfolio/:id/comments", :to => "portfolios#comment"
      namespace :users do
        resources :passwords
        resources :registrations
        resources :confirmations
      end
      resources :rates, only: :create
      resources :comments, only: :create
      resources :categories
      resources :portfolios
      resources :image_uploaders, only: :create
    end
  end
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end
  get "*path", :to => "static_pages#home"
end
