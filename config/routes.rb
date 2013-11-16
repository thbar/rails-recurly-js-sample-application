RailsRecurlyJsSampleApplication::Application.routes.draw do
  devise_for :users

  root 'site#index'


end
