Rails.application.routes.draw do
  post 'like' => 'likes#toggle'


  devise_for :users, controllers: {:registrations => 'users/registrations'}


  get :about, :to => 'pages#about'

  get :contact, :to => 'pages#contact'

  get :sell, :to => 'pages#sell'

  get :careers, to: 'pages#careers'

  get :blog, to: 'pages#blog'
  
  get :search, controller: :search

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  resources :categories
  resources :subcategories
  
  resources :stores do
    resources :products

    post 'follow', :to => 'followings#create'
    delete 'unfollow', :to => 'followings#destroy'
  	get 'dashboard', to: "stores#dashboard"
    get 'settings', to: "stores#settings"
  end

  resources :users, :only => [:show]
  
  
  root 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end