namespace :daily_survey_reminders do
  desc 'deliver all daily survey reminders'
  task deliver: :environment do
    User.all.each do |user|
      surveys = Survey.to_complete_on_day user.day_of_study

      if surveys.count > 0
        ParticipantMailer.daily_survey_email(user, surveys).deliver
      end
    end
  end

end
