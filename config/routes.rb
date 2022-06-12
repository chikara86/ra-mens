Rails.application.routes.draw do

      devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  namespace :admin do
  resources :areas, only: [:index,:edit,:create,:update]
  resources :genres, only: [:index,:edit,:create,:update]
  end
end
