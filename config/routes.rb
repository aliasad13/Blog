Rails.application.routes.draw do


  root 'blogs#home'
  resources :blogs do
    resources :comments
  end

  get 'signup', to: 'users#new' #to users controller new action
  resources :users,except: [:new]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'



end
