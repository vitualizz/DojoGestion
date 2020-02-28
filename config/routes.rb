Rails.application.routes.draw do
  root 'home#index'
  devise_for :teachers, :students, :parents
  resources :qualifications, only: [:index]
  #devise_for :users
end
