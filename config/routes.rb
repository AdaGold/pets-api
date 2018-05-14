Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pets, except: [:update]
  put '/pets/:id/vaccinated', to: 'pets#vaccinated', as: 'vaccinated'
  put '/pets/:id/dibs', to: 'pets#dibs', as: 'dibs'
  get '/dan', to: 'pets#dan', as: 'dan'
end
