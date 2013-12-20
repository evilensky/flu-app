FluApp::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users

  root 'recruitment#index'
  get 'recruitment/enroll', :as => 'enroll'
  get 'recruitment/about_us', :as => 'about_us'

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
