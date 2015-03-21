Rails.application.routes.draw do
  resources :parkings
  root 'parkings#index'
end
