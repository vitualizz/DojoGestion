Rails.application.routes.draw do
  devise_for :teachers, :students, :parents
  ["teacher", "student", "parent"].each do |user|
    devise_scope user.intern do
      unauthenticated do
        root 'devise/sessions#new', as: "unauthenticated_#{user}_root"
      end
    end
  end
  root 'home#index'
  resources :qualifications, only: [:index]
  #devise_for :users
end
