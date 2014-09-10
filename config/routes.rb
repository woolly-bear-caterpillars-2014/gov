Rails.application.routes.draw do
  root 'states#index'

  post 'send_messages' => 'send_messages#send_mail'
  
	get 'congress_people/:id/articles' => 'congress_people#show_articles', as: 'show_articles'
	get 'congress_people/:id/bills' => 'congress_people#show_bills', as: 'show_bills'
	
	resources :states, only: [:index, :show]
	resources :congress_people, only: [:index, :show, :data_visualization]

  match 'congress_people/:id/sentiment_visualization', to: 'congress_people#sentiment_visualization', via: [:get, :post], as: 'data_visualization'

	resources :gmaps, only: [:index]
	resources :articles, only: [:index]

  
end
