class RemoveValueFromVotes < ActiveRecord::Migration[5.0]
  def change
    remove_column :votes, :value
  end
end
