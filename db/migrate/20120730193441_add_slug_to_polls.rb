class AddSlugToPolls < ActiveRecord::Migration
  def change
  	add_column :polls, :slug, :string, :null => false
  	add_index :polls, :slug
  end
end
