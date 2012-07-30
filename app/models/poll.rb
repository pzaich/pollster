class Poll < ActiveRecord::Base
	extend FriendlyId
	attr_accessible :edit_slug, :name

	friendly_id :name, :use => :slugged

  before_save :generate_edit_slug

  validates_uniqueness_of :name, :case_sensitive => true


	private

	  def generate_edit_slug (salt = "dkjekdldc")
	  	self.edit_slug = Digest::MD5.hexdigest(self.name + salt)
	  end

end
