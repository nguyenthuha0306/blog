Rails.application.routes.draw do

  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'
  get 'users/new'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'signin'   => 'sessions#new'
  post   'signin'   => 'sessions#create'
  delete 'signout'  => 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  
  resources :password_resets, except: [:index, :show, :destroy]
  resources :entries, only: [:create, :destroy, :show]
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
