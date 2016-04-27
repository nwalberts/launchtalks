Rails.application.routes.draw do
  root "presentations#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
  end

  resources :presentations do
    resources :comments, only: [:new, :create, :show]
  end

  resources :meetups, only: [:index, :show]

  resources :users, only: [:index, :show, :destroy]

  resources :profiles, only: [:show, :edit, :update]

end
