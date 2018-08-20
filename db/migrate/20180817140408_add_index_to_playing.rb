class AddIndexToPlaying < ActiveRecord::Migration[5.2]
  def change
  	add_index :playings, [:game_id, :group_id]
  end
end
