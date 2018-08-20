class AddColumns < ActiveRecord::Migration[5.2]
  def change
  	add_column :matches, :a_team_id, :integer
  	add_column :matches, :b_team_id, :integer
  	
  	add_column :challenges, :a_team_id, :integer
  	add_column :challenges, :b_team_id, :integer
  	
  end
end
