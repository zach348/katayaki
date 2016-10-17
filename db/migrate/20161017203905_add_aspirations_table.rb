class AddAspirationsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :aspirations do |t|
      t.belongs_to :user
      t.belongs_to :goal
    end
  end
end
