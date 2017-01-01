Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "welcome#index"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, :only => [:new, :create, :show]

  resources :welcome, :only => [:index]

  namespace :admin do
    resources :users, :only => [:index, :show, :edit, :update, :destroy]
    resources :gifs, :only => [:index]
  end
end
