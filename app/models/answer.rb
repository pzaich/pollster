class Answer < ActiveRecord::Base
  attr_accessible :value, :question_id
  belongs_to :question
  has_many :responses

  validates_presence_of :value
end
