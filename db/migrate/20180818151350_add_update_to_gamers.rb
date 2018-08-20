class AddUpdateToGamers < ActiveRecord::Migration[5.2]
  def change
    add_column :gamers, :updated, :boolean , default: false
  end
end
