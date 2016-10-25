class AddDetailsToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :details, :text
  end
end
