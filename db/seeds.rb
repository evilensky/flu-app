User.create(
  {
    email: 'admin@example.com',
    password: 'foobar1!',
    password_confirmation: 'foobar1!',
    is_admin: true
  }
)

Survey.create([
  { title: 'Baseline', days_to_administer: [] },
  { title: 'Daily', days_to_administer: (1..14).to_a },
  { title: 'Day 14', days_to_administer: [14] }
])

baseline = Survey.find_by_title('Baseline')
Question.create([
  { data_label: 'Q1', content: 'Age', survey: baseline, input_type: 'integer' },
  { data_label: 'Q2', content: 'Gender', survey: baseline, input_type: 'radio_buttons' },
  { data_label: 'Q3', content: 'Weight (lbs.)', survey: baseline, input_type: 'integer' },
  { data_label: 'Q4', content: 'Height (ft.)', survey: baseline, input_type: 'integer' },
  { data_label: 'Q5', content: 'Height (in.)', survey: baseline, input_type: 'integer' },
  { data_label: 'Q6', content: 'When did your Flu symptoms start? (mm/dd/yyyy)', survey: baseline, input_type: 'date' },
  { data_label: 'Q7', content: 'Did you get a Flu shot this year (2013)?', survey: baseline, input_type: 'radio_buttons' },
  { data_label: 'Q8', content: 'Did you get a Flu shot last year (2012)?', survey: baseline, input_type: 'radio_buttons' },
  { data_label: 'Q9', content: 'Do you have any of the following conditions? (mark all that apply)', survey: baseline, input_type: 'check_boxes' }
])

gender = Question.find_by_data_label('Q2')
Response.create([
  { label: 'Male', value: 1, question: gender },
  { label: 'Female', value: 2, question: gender }
])

shot_2013 = Question.find_by_data_label('Q7')
Response.create([
  { label: 'Yes', value: 1, question: shot_2013 },
  { label: 'No', value: 2, question: shot_2013 },
  { label: "I don't know", value: 88, question: shot_2013 }
])

shot_2012 = Question.find_by_data_label('Q8')
Response.create([
  { label: 'Yes', value: 1, question: shot_2012 },
  { label: 'No', value: 2, question: shot_2012 },
  { label: "I don't know", value: 88, question: shot_2012 }
])

conditions = Question.find_by_data_label('Q9')
Response.create([
  { label: 'Diabetes', value: 1, question: conditions },
  { label: 'COPD/Emphysema/Asthma', value: 2, question: conditions },
  { label: 'Asthma', value: 3, question: conditions },
  { label: 'Cancer', value: 4, question: conditions },
  { label: 'Immune compromise related to medications (chronic steroids, immune modulators, other)', value: 5, question: conditions },
  { label: 'Transplant recipient', value: 6, question: conditions },
  { label: 'Heart failure', value: 7, question: conditions },
  { label: 'Kidney failure', value: 8, question: conditions },
  { label: 'On dialysis', value: 9, question: conditions },
  { label: 'Neuro-muscular disorder (multiple sclerosis, paraplegia, quadriplegia, other)', value: 10, question: conditions },
  { label: 'Cirrhosis', value: 11, question: conditions }
])

daily = Survey.find_by_title('Daily')
Question.create([
  { data_label: 'Q10', content: 'Have you have any of these signs or symptoms in the past 24 hours?', survey: daily, input_type: 'check_boxes' }
])

symptoms = Question.find_by_data_label('Q10')
Response.create([
  { label: 'Fever', value: 1, question: symptoms },
  { label: 'Chills', value: 2, question: symptoms },
  { label: 'Sore throat', value: 3, question: symptoms },
  { label: 'Cough', value: 4, question: symptoms },
  { label: 'Difficulty breathing', value: 5, question: symptoms },
  { label: 'Runny nose or sinus congestion', value: 6, question: symptoms },
  { label: 'Headache', value: 7, question: symptoms },
  { label: 'Muscle aches', value: 8, question: symptoms },
  { label: 'Joint aches', value: 9, question: symptoms },
  { label: 'Chest pain ', value: 10, question: symptoms },
  { label: 'Abdominal pain', value: 11, question: symptoms },
  { label: 'Diarrhea', value: 12, question: symptoms },
  { label: 'Taking Tamiflu', value: 13, question: symptoms },
  { label: 'Taking antibiotics', value: 14, question: symptoms }
])

day14 = Survey.find_by_title('Day 14')
Question.create([
  { data_label: 'Q11', content: 'Were you hospitalized because of the flu?', survey: day14, input_type: 'radio_buttons' },
  { data_label: 'Q12', content: 'Were you in the intensive care unit?', survey: day14, input_type: 'radio_buttons' },
  { data_label: 'Q13', content: 'Did you require mechanical ventilation?', survey: day14, input_type: 'radio_buttons' },
  { data_label: 'Q14', content: 'Did you receive Tamiflu?', survey: day14, input_type: 'radio_buttons' },
  { data_label: 'Q15', content: 'Tamiflu start date (mm/dd/yyyy)', survey: day14, input_type: 'date' },
  { data_label: 'Q16', content: 'Tamiflu end date (mm/dd/yyyy)', survey: day14, input_type: 'date' },
  { data_label: 'Q17', content: 'Were you diagnosed by a physician with any of these complications of the Flu? (mark all that apply)', survey: day14, input_type: 'check_boxes' }
])

hospitalized = Question.find_by_data_label('Q11')
Response.create([
  { label: 'Yes', value: 1, question: hospitalized },
  { label: 'No', value: 2, question: hospitalized }
])

intensive = Question.find_by_data_label('Q12')
Response.create([
  { label: 'Yes', value: 1, question: intensive },
  { label: 'No', value: 2, question: intensive }
])

ventilation = Question.find_by_data_label('Q13')
Response.create([
  { label: 'Yes', value: 1, question: ventilation },
  { label: 'No', value: 2, question: ventilation }
])

tamiflu = Question.find_by_data_label('Q14')
Response.create([
  { label: 'Yes', value: 1, question: tamiflu },
  { label: 'No', value: 2, question: tamiflu },
  { label: "I don't know", value: 88, question: tamiflu }
])

complications = Question.find_by_data_label('Q17')
Response.create([
  { label: 'Pneumonia', value: 1, question: complications },
  { label: 'Bronchitis', value: 2, question: complications },
  { label: 'Sinusitis', value: 3, question: complications },
  { label: 'Otitis', value: 4, question: complications }
])
