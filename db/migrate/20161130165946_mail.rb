class Mail < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :recipient
      t.string :subject
      t.text :plain
      t.text :html

      t.timestamps
    end
  end
end
