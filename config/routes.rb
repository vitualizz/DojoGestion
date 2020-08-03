Rails.application.routes.draw do

  root 'home#index'

  devise_for :teachers, :students, :parents, skip: [:sessions]

 # ["teacher", "student", "parent"].each do |user|
 #   devise_scope user.intern do
 #     unauthenticated do
 #       root 'devise/sessions#new', as: "unauthenticated_#{user}_root"
 #     end
 #   end
 # end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  devise_scope :user do
    unauthenticated do
      get '/login' => 'users/sessions#new'
    end
  end


  # Main
  resources :areas, only: [:index]
  resources :qualifications, only: [:index]
  resources :teachers, only: [:index]

  # Setting
  resources :settings, only: [:index, :update]
end
