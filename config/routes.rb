Rails.application.routes.draw do
  resources :houses do
    resources :services
  end
  get "pages/home"
  devise_for :users, controllers: {
                       omniauth_callbacks: "users/omniauth_callbacks",
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                       confirmations: "users/confirmations",
                     }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
  resources :users, only: [:index, :show, :destroy]

  #routes per mail controller contatta admin
  resources :email_messages, only: [:index, :new, :create, :destroy]
  #se voglio usare altra vista es. views/emails/send_email.html.erb
  #get 'send_email', to: 'email_messages#new'
  #post 'send_email', to: 'email_messages#create'

  get 'users/:id/toggle_user_type' => "users#toggle_user_type", as: :toggle_user_type
  get 'users/:id/report_and_delete' => "users#report_and_delete", as: :report_and_delete

  #delete 'email_messages/:id', to: 'email_messages#destroy'

  get 'email_messages/contact_host' => "email_messages#contact_host", as: :contact_host

end
