RailsRecurlyJsSampleApplication::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'registrations' }

  root 'site#index'

  get 'dashboard' => 'dashboard#index', as: 'dashboard'

  resource :subscription, only: [:new] do
    get :error
    post :confirm
    get :edit
    post :billing_information, action: 'update'
  end
end
