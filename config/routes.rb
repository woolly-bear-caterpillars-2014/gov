Rails.application.routes.draw do
  root 'states#index'
  resources :states, only: [:index, :show]
  resources :congress_people, only: [:index, :show]
	resources :gmaps, only: [:index]
	resources :articles, only: [:index]
end
