Rails.application.routes.draw do

  root 'home#index'
  
  # DEVISE USERS
  devise_for :users, controllers: { registrations: 'registrations' }, skip: [:registrations, :sessions]
  devise_scope :user do
    get 'signup', to: 'registrations#new', as: :new_user_registration
    post 'signup', to: 'registrations#create', as: :user_registration
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  # USERS
  # get 'users/:id', to: 'users#show', as: :user
  # get 'users/:id/edit', to: 'users#edit', as: :edit_user_page
  # post 'users/:id/edit', to: 'users#update', as: :update_user_page
end
