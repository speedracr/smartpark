Rails.application.routes.draw do
  get 'cars/index'

  get 'cars/show'

  get 'cars/new'

  get 'cars/create'

  get 'cars/update'

  get 'cars/destroy'

  devise_for :users
  resources :cars
  resources :parkdecks
  resources :parkings do 
    member do 
      get "checkout", to: "parkings#checkout"
    end
  end

  root 'parkings#index'
end
