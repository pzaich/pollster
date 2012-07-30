class Poll < ActiveRecord::Base
  attr_accessible :edit_slug, :name
  before_validation :clean_name
  before_save :generate_edit_slug

  validates :name, :uniqueness => true

  private

  def clean_name
  	self.name = name.strip.downcase
  end

  def generate_edit_slug
  	self.edit_slug = Digest::MD5.hexdigest(self.name)
  end

end
