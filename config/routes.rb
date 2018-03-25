Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :patios, only: [:show, :index]
  root 'patios#index'
end
