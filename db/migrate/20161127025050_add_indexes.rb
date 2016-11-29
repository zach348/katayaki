class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    add_index :goals, :title, name: 'goals_title_ix'
    add_index :goals, :details, name: 'goals_details_ix'
    add_index :votes, :user_id, name: 'votes_user_id_ix'
    add_index :votes, :aspiration_id, name: 'votes_aspiration_id_ix'
    add_index :affiliations, :user_id, name: 'affiliations_user_id_ix'
    add_index :affiliations, :group_id, name: 'affiliations_group_id_ix'
    add_index :aspirations, :user_id, name: 'aspirations_user_id_ix'
    add_index :aspirations, :goal_id, name: 'aspiration_goal_id_ix'
  end
end
