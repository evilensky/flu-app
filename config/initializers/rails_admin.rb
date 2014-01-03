# RailsAdmin config file. Generated on September 24, 2013 09:52
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Fluomics', 'Admin']

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  config.excluded_models = ['Response', 'Survey', 'SurveyCompletionMessage', 'SurveySubmission', 'SymptomsStartedOnSource']

  # Include specific models (exclude the others):
  # config.included_models = ['Question', 'Response', 'Survey', 'SurveySubmission', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]

  config.authenticate_with do
    redirect_to '/users/sign_in' unless (current_user && current_user.is_admin?)
  end

  ################  Model configuration  ################

  nav_label = 'trial management'

  config.model 'BloodDrawAppointment' do
    navigation_label nav_label

    list do
      field :participant_id do
        label 'Id'
      end
      field :participant_full_name do
        label 'Name'
      end
      field :participant_date_of_birth do
        label 'DOB'
      end
      field :date do
        label 'Appointment date'
      end
    end

    export do
      field :participant_id do
        label 'Id'
      end
      field :participant_full_name do
        label 'Name'
      end
      field :participant_date_of_birth do
        label 'DOB'
      end
      field :date do
        label 'Appointment date'
      end
    end
  end

  config.model 'Consent' do
    navigation_label nav_label

    list do
      field :user
      field :type
      field :created_at
    end
  end

  config.model 'CurrentlyIllConsent' do
    navigation_label nav_label

    list do
      current_consent_fields
    end

    export do
      current_consent_fields
    end

    show do
      current_consent_fields
    end
  end

  def current_consent_fields
    field :first_name
    field :last_name
    field :date_of_birth
    field :email
    field :may_save_info
    field :may_not_save_info
    field :may_be_contacted
    field :may_not_be_contacted
    field :has_read_consent
  end

  config.model 'PreviouslyIllConsent' do
    navigation_label nav_label

    list do
      previous_consent_fields
    end

    export do
      previous_consent_fields
    end

    show do
      previous_consent_fields
    end
  end

  def previous_consent_fields
    field :first_name
    field :last_name
    field :date_of_birth
    field :email
    field :may_save_info
    field :may_not_save_info
    field :may_be_contacted
    field :may_not_be_contacted
    field :has_read_consent
  end

  config.model 'CurrentlyIllMembership' do
    navigation_label nav_label

    list do
      field :user
      field :consented_on
      field :enrolled_on
      field :symptoms_started_on
      field :tested_positive_on
      field :tested_negative_on
    end
  end

  config.model 'PreviouslyIllMembership' do
    navigation_label nav_label

    list do
      field :user
      field :consented_on
      field :enrolled_on
      field :symptoms_started_on
    end
  end

  config.model 'User' do
    navigation_label nav_label

    object_label_method :email

    list do
      field :email
      field :created_at
      field :is_admin
      field :participant_id
    end

    show do
      field :email
      field :survey_submissions
      field :consent
      field :day_of_study do
        pretty_value do
          value.to_i
        end
      end
    end

    edit do
      field :email
      field :password
      field :password_confirmation
      field :is_admin
      field :survey_submissions
      field :consent
      field :currently_ill_membership
      field :previously_ill_membership
      field :blood_draw_appointment
    end
  end

  config.model 'SurveyDataSet' do
    navigation_label nav_label

    list do
      survey_data_set_list_fields
    end

    export do
      survey_data_set_list_fields
    end
  end

  def survey_data_set_list_fields
    field :participant_id do
      label 'id'
    end
    field :datebirt do
      label 'datebirt'
    end
    field :fludx do
      label 'fludx'
    end
    field :gender do
      label 'gender'
    end
    field :weight do
      label 'weight'
    end
    field :height do
      label 'height'
    end
    field :flusym do
      label 'flusym'
    end
    field :vaccine13 do
      label 'vaccine13'
    end
    field :vaccine12 do
      label 'vaccine12'
    end
    field :diab do
      label 'diab'
    end
    field :copd do
      label 'copd'
    end
    field :asthma do
      label 'asthma'
    end
    field :canc do
      label 'canc'
    end
    field :imco do
      label 'imco'
    end
    field :tran do
      label 'tran'
    end
    field :hrtf do
      label 'hrtf'
    end
    field :kidf do
      label 'kidf'
    end
    field :dial do
      label 'dial'
    end
    field :nemu do
      label 'nemu'
    end
    field :cirr do
      label 'cirr'
    end
    field :hosp do
      label 'hosp'
    end
    field :icu do
      label 'icu'
    end
    field :vent do
      label 'vent'
    end
    field :osel do
      label 'osel'
    end
    field :osel_d1 do
      label 'osel_d1'
    end
    field :osel_d2 do
      label 'osel_d2'
    end
    field :pneu do
      label 'pneu'
    end
    field :bron do
      label 'bron'
    end
    field :sinu do
      label 'sinu'
    end
    field :otit do
      label 'otit'
    end
    (1..14).each do |i|
      field "qday_#{ i }" do
        label "qday_#{ i }"
      end
      field "rday_#{ i }" do
        label "rday_#{ i }"
      end
      field "fevr_#{ i }" do
        label "fevr_#{ i }"
      end
      field "chls_#{ i }" do
        label "chls_#{ i }"
      end
      field "sthr_#{ i }" do
        label "sthr_#{ i }"
      end
      field "coug_#{ i }" do
        label "coug_#{ i }"
      end
      field "dysp_#{ i }" do
        label "dysp_#{ i }"
      end
      field "cong_#{ i }" do
        label "cong_#{ i }"
      end
      field "head_#{ i }" do
        label "head_#{ i }"
      end
      field "myal_#{ i }" do
        label "myal_#{ i }"
      end
      field "arth_#{ i }" do
        label "arth_#{ i }"
      end
      field "chpa_#{ i }" do
        label "chpa_#{ i }"
      end
      field "abpa_#{ i }" do
        label "abpa_#{ i }"
      end
      field "dirh_#{ i }" do
        label "dirh_#{ i }"
      end
      field "oslt_#{ i }" do
        label "oslt_#{ i }"
      end
      field "atbx_#{ i }" do
        label "atbx_#{ i }"
      end
    end
  end

  config.model 'Question' do 
    navigation_label 'configuration'

    field :data_label
    field :content
    field :input_type
  end
end
