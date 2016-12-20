class AddAspcountToGoalsTable < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :aspirations_count, :integer, default: 0
  end
end
