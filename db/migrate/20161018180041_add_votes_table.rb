class AddVotesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.belongs_to :aspiration
      t.integer :value, null: false
    end
  end
end
