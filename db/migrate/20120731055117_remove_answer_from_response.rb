class RemoveAnswerFromResponse < ActiveRecord::Migration
  def up
  	remove_column :responses, :answer
  end

  def down
  end
end
