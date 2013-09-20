class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :responses

  def response_data
  end
end
