class AddTimestamps < ActiveRecord::Migration[5.0]
  def change
    add_column(:groups, :created_at, :datetime)
    add_column(:groups, :updated_at, :datetime)
    add_column(:affiliations, :created_at, :datetime)
    add_column(:affiliations, :updated_at, :datetime)
    add_column(:aspirations, :created_at, :datetime)
    add_column(:aspirations, :updated_at, :datetime)
    add_column(:goals, :created_at, :datetime)
    add_column(:goals, :updated_at, :datetime)
    add_column(:votes, :created_at, :datetime)
    add_column(:votes, :updated_at, :datetime)
  end
end
