class Question < ActiveRecord::Base
  attr_accessible :title
  has_many :responses

  validates_presence_of :title
end
