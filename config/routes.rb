Rails.application.routes.draw do

  root "presentations#index"

  resources :presentations

  resources :users, only: [:index, :destroy]

  devise_for :users

  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
  end
end
