class Question < ActiveRecord::Base
  attr_accessible :title
  belongs_to :poll
  has_many :responses
  has_many :answers

  validates_presence_of :title
end
