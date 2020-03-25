Rails.application.routes.draw do

  # Devise
  devise_for :teachers, :students, :parents
  ["teacher", "student", "parent"].each do |user|
    devise_scope user.intern do
      unauthenticated do
        root 'devise/sessions#new', as: "unauthenticated_#{user}_root"
      end
    end
  end
  root 'home#index'

  # Main
  resources :areas, only: [:index]
  resources :qualifications, only: [:index]

  # Setting
  resources :settings, only: [:index, :update]
  namespace :settings do
    resources :areas, only: [:index, :new]
  end
end
