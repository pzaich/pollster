class Question < ActiveRecord::Base
  attr_accessible :title

  has_many :responses
end
