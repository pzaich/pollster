class Response < ActiveRecord::Base
  attr_accessible :answer, :question_id

  validates_presence_of :answer
  
  belongs_to :question
end
