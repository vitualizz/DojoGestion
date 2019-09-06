class ApplicationController < ActionController::Base
  devise_group :user, contains: [:teacher, :student, :parent]
end
