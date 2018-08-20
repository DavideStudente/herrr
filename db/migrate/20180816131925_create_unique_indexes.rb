class CreateUniqueIndexes < ActiveRecord::Migration[5.2]
  def change
    #in Group 
    add_index :groups, :name, :unique => true
	#in Game
	add_index :games, :name
    end
  
end
