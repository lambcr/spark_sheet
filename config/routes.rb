Rails.application.routes.draw do
  resources :cards

  root 'cards#index'
end
