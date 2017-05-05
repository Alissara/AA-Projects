Rails.application.routes.draw do
  get 'comments/create'

  get 'comments/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]

  resources :subs, only: [:index, :show, :new, :create, :edit, :update]

  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:new]
  end

  resources :comments, only: [:create, :show]

end
