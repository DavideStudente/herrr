class AddAttributesToGamers < ActiveRecord::Migration[5.2]
  def change
    add_column :gamers, :description, :string
    add_column :gamers, :nation, :string
  end
end
