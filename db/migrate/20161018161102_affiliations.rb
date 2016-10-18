class Affiliations < ActiveRecord::Migration[5.0]
  def change
    create_table :affiliations do |t|
      t.belongs_to :user, null: false
      t.belongs_to :group, null: false
      t.string :moderator, null: false, default: 'false'
    end
  end
end
