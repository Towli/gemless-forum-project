Rails.application.routes.draw do
  
  root 'discussions#index'
  
  resources :posts
  resources :users
  resources :discussions do
  	member do
  		delete :destroy
  	end
  end

end