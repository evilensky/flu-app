FluApp::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  root 'consents#new'

  resources :surveys, only: [:index, :show]
  resources :survey_submissions, only: :create
  resources :consents, only: [:new, :create]
  resources :blood_draw_appointments, only: [:new, :create]

  get 'errors/default', :as => 'errors'

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end
end
