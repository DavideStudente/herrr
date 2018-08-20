class RemoveMemberIdFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :member_id, :string
  end
end
