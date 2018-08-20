class AddJoinTableGamesGroups < ActiveRecord::Migration[5.2]
  def change
  	create_join_table :games, :groups do |t|
    t.index :game_id
    t.index :group_id
  end
end
end
  

