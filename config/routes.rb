Rails.application.routes.draw do
  root 'home#index'
  devise_for :teachers, :students, :parents
  #devise_for :users
end
