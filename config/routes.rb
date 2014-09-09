Rails.application.routes.draw do
  root 'states#index'
<<<<<<< HEAD
  resources :states, only: [:index, :show]
  resources :congress_people, only: [:index, :show]
	resources :gmaps, only: [:index]
	resources :articles, only: [:index]
=======
  resources :states, only: [:index, :show, :create] do
    resources :congress_people, only: [:index, :show]
  end

    resources :gmaps

  resources :congress_people
>>>>>>> ee404e655ad693fd629e1a26056d8c5a2f4208f2
end
