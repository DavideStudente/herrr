class AddAvatarToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :avatar, :string
  end
end
