Rails.application.routes.draw do
  
  root 'landing#home'
  
  resources :posts
  resources :users do
    get 'discussions' => 'user_discussions#index'
  end
  resources :discussions do
  	member do
  		delete :destroy
  	end
  end

  resources :replies, only: [:create, :destroy]

  get 		'sign_in'	 => 'sessions#new'
  post 		'sign_in'	 => 'sessions#create'
  get 	  'sign_out' => 'sessions#destroy'

end