class AddDefaultValToGoalDescription < ActiveRecord::Migration[5.0]
  def change
    change_column :goals, :description, :string, default: ""
  end
end
