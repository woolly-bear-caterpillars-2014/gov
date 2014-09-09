Rails.application.routes.draw do
  root 'states#index'
  resources :states, only: [:index, :show]
  resources :congress_people
	resources :gmaps, only: [:index]
	resources :articles, only: [:index]
end
