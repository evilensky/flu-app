FluApp::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  root 'consents#new'
  resources :surveys, only: [:index, :show]
  resources :consents, only: [:new, :create]
end
