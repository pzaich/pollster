class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :answer
      t.integer :title_id
      t.timestamps
    end

    add_index :response, :title_id
  end
end
