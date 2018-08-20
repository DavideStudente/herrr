class ChangeTeamIdInTeamToTeams < ActiveRecord::Migration[5.2]
  def change
  	    rename_column :gamers, :team_id_id, :team_id
  end
end
