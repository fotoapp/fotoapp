Foto::Application.routes.draw do
  root :to => "home#index"

  resources :photo_stores, :only => [:create, :update, :destroy]
  resources :photos, :only => [:create]

  get "/account" => "account#show", :as => :account

  get "/auth/:provider/callback" => "sessions#create"
  get "/signin" => "sessions#new", :as => :signin
  get "/signout" => "sessions#destroy", :as => :signout
  get "/auth/failure" => "sessions#failure"
end
