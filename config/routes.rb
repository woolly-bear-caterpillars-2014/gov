Rails.application.routes.draw do
  root 'states#index'
  resources :gmaps, only: [:index, :show]
  resources :states, only: [:index, :show] do
    resources :congress_people, only: [:index, :show]
  end

  resources :congress_people
end
