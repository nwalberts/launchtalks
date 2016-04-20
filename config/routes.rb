Rails.application.routes.draw do
  root "presentations#index"

  devise_for :users

  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
  end

  resources :presentations
  resources :profiles, only: [:show, :edit, :update]

  resources :users, only: [:index, :show, :destroy]
end
