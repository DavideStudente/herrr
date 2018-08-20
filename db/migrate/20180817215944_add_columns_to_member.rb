class AddColumnsToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :gamer_id, :integer
    add_column :members, :team_id, :integer
  end
end
