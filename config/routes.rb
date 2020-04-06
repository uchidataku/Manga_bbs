Rails.application.routes.draw do
  root 'top_pages#home'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
         sessions: 'users/sessions',
        passwords: 'users/passwords'
  }
  resources :posts, only: [:show] do
    resources :responses, only: [:create]
  end
  resources :users, only: [:show] do
    resources :posts, only: [:new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
