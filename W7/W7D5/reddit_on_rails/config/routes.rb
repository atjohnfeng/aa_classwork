Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only:[:new, :create, :destroy]
  resources :users, only:[:new, :create, :show, :index]
  resources :subs #do
    # resources :posts, only:[:new, :create]
    # resources :posts, only:[:show, :destroy, :edit, :update]
  # end
end
