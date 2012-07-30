class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :name, :null => false
      t.string :edit_slug, :null => false
      t.timestamps
    end

    add_index :polls, [:name, :edit_slug]
  end
end
