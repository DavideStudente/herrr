class AddTeamIdToGamer < ActiveRecord::Migration[5.2]
  def change
    add_reference :gamers, :team_id, foreign_key: true
  end
end
