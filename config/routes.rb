Rails.application.routes.draw do
  
  root 'discussions#index'
  
  resources :posts
  resources :users
  resources :discussions do
  	member do
  		delete :destroy
  	end
  end

  get 		'sign_in'	 => 'sessions#new'
  post 		'sign_in'	 => 'sessions#create'
  get 	'sign_out'	 => 'sessions#destroy'

end