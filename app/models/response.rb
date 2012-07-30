class Response < ActiveRecord::Base
  attr_accessible :answer, :title_id

  belongs_to :question
end
