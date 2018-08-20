class AddColumnsToPlaying < ActiveRecord::Migration[5.2]
  def change

    add_column :playings, :game_id, :integer
    add_column :playings, :group_id, :integer
  end
end
