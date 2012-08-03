class Response < ActiveRecord::Base
  attr_accessible :answer_id, :question_id
  belongs_to :answer
  belongs_to :question

  validates_presence_of :answer, :question
  # validates_uniqueness_of :answer, :scope => :question
end
