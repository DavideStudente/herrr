class AddRoleToGamers < ActiveRecord::Migration[5.2]
  def change
    add_column :gamers, :role, :integer
  end
end
