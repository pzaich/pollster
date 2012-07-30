class AddIndexToPollId < ActiveRecord::Migration
  def change
  	add_index :questions, :poll_id
  end
end
