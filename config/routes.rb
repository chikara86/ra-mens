
Rails.application.routes.draw do


      devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
      root to: 'homes#top'
      resources :users, only: [:show, :edit, :update,]
      resources :ramens, only: [:top,:new,:create,:index,:show,:edit,:update,:destroy]
      resources :ramen_comments, only: [:index,:create,:destroy]
      resource :ramen_favorites, only: [:create, :destroy]



  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to  'confirmations#new'
  namespace :admin do
  resources :users, only: [:index,:update,:destroy]
  resources :areas, only: [:index,:edit,:create,:update]
  resources :genres, only: [:index,:edit,:create,:update]
  end
end
