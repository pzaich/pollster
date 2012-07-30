class Question < ActiveRecord::Base
  attr_accessible :title
  belongs_to :poll
  has_many :responses

  validates_presence_of :title
end
