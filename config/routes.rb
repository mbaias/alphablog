Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'pages#home'
	get 'about', to: 'pages#about'
	get 'signin', to: 'sessions#new'
	get 'signup', to: 'users#new'
	resources :sessions, except: [:new]
	resources :users, except: [:new]
	resources :articles
end
