Rails.application.routes.draw do
  root 'states#index'
  resources :states, only: [:index, :show]
  resources :congress_people
<<<<<<< HEAD

  get 'congress_people/:id/sentiment_visualization'=> 'congress_people#sentiment_visualization'
=======
	resources :gmaps, only: [:index]
	resources :articles, only: [:index]

  get 'congress_people/:id/articles' => 'congress_people#show_articles', as: 'show_articles'
  get 'congress_people/:id/bills' => 'congress_people#show_bills', as: 'show_bills'
>>>>>>> 50ee0ec3528ddc40ecddf912729590a35391d430
end
