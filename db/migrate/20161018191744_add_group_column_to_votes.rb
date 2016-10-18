class AddGroupColumnToVotes < ActiveRecord::Migration[5.0]
  def change
    add_column :aspirations, :group_id, :integer
  end
end
