set :output, 'log/cron.log'

every 1.day, at: '3:00 am' do
  rake 'daily_survey_reminders:deliver'
end
