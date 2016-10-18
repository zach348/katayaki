class AddGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.boolean :moderated, null: false, default: false
    end
  end
end
