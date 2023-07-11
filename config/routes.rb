Rails.application.routes.draw do
  resources :houses do
    resources :services
  end
  get "pages/home"
  devise_for :users, controllers: {
                       omniauth_callbacks: "users/omniauth_callbacks",
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
  resources :users, only: [:index]
  get 'users/:id/toggle_user_type' => "users#toggle_user_type", as: :toggle_user_type
end
