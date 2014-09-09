Rails.application.routes.draw do
  root 'states#index'
  resources :states, only: [:index, :show] do
    resources :congress_people, only: [:index, :show]
  end

    resources :gmaps

  resources :congress_people

  get 'congress_people/:id/sentiment_visualization'=> 'congress_people#sentiment_visualization'
end
