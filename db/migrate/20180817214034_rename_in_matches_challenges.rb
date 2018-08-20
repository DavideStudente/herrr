class RenameInMatchesChallenges < ActiveRecord::Migration[5.2]
  def change
  	rename_column :matches, :a_team_id, :team_id
  	rename_column :matches, :b_team_id, :matching_team_id

  	rename_column :challenges, :a_team_id, :team_id
  	rename_column :challenges, :b_team_id, :challenging_team_id
  end
end
