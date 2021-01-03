Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  # resources :cocktails
  resources :cocktails, only: %i[index show create new] do
    resources :doses, only: %i[new create]
    resources :reviews, only: [:create]
  end
  resources :doses, only: [:destroy]
end
