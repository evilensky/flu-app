FluApp::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  root 'currently_ill_consents#new'

  resources :surveys, only: [:index, :show]
  resources :survey_submissions, only: :create
  resources :currently_ill_consents, only: [:new, :create]
  resources :previously_ill_consents, only: [:new, :create]
  resources :blood_draw_appointments, only: [:new, :create]

  get 'errors/default', :as => 'errors'

  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end
end
