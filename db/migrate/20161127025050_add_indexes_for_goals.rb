class AddIndexesForGoals < ActiveRecord::Migration[5.0]
  def change
    add_index :goals, :title
    add_index :goals, :details
  end
end
