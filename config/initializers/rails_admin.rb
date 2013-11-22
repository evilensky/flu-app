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
  # config.excluded_models = ['Question', 'Response', 'Survey', 'SurveySubmission', 'User']

  # Include specific models (exclude the others):
  # config.included_models = ['Question', 'Response', 'Survey', 'SurveySubmission', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  config.model 'BloodDrawAppointment' do
    list do
      field :user
      field :date
      field :created_at
    end
  end

  config.model 'Consent' do
    list do
      field :user
      field :created_at
    end
  end

  config.model 'CurrentlyIllMembership' do
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
    list do
      field :user
      field :consented_on
      field :enrolled_on
      field :symptoms_started_on
    end
  end

  config.model 'Question' do
    list do
      field :survey
      field :data_label
      field :content
      field :responses
    end
  end

  config.model 'Response' do
    list do
      field :question
      field :label
      field :value
    end
  end

  config.model 'Survey' do
    list do
      field :title
      field :questions
      field :responses
      field :survey_submissions
    end
  end

  config.model 'SurveySubmission' do
    show do
      field :user
      field :survey
      field :response_data do
        pretty_value do
          value.map {|k, v| "#{ k }: #{ v }" }.join ', '
        end
      end
      field :created_at
    end

    list do
      field :user
      field :survey
      field :response_data do
        pretty_value do
          value.map {|k, v| "#{ k }: #{ v }" }.join ', '
        end
      end
      field :created_at
    end
  end

  config.model 'User' do
    object_label_method :email

    list do
      field :email
      field :created_at
      field :admin
    end
  end
end