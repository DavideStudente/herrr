class CreateGamersTeamsJoinTable < ActiveRecord::Migration[5.2]
  
  def change
  

  # If you want to add an index for faster querying through this join:
  create_join_table :gamers, :teams do |t|
    t.index :gamer_id
    t.index :team_id
  end
 
  end
end
