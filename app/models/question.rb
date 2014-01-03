class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :responses, -> { order 'position' }
end
