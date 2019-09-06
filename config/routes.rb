Rails.application.routes.draw do
  devise_for :teachers, :students, :parents
end
