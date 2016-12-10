class AspVoteCountCache < ActiveRecord::Migration[5.0]
  def change
    add_column :aspirations, :votes_count, :integer, default: 0
  end
end
