class AddIndexToAnswerId < ActiveRecord::Migration
  def change
  	add_index :responses, :answer_id
  end
end
