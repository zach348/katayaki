class AddGoalsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.text :description
    end
  end
end
