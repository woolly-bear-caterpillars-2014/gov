Rails.application.routes.draw do
  root 'states#index'

  post 'send_messages' => 'send_messages#send_mail'
  get 'congress_people/:id/sentiment_visualization'=> 'congress_people#sentiment_visualization', as: 'data_visualization'
	get 'congress_people/:id/articles' => 'congress_people#show_articles', as: 'show_articles'
	get 'congress_people/:id/bills' => 'congress_people#show_bills', as: 'show_bills'
	
	resources :states, only: [:index, :show]
	resources :congress_people

	resources :gmaps, only: [:index]
	resources :articles, only: [:index]

  
end
