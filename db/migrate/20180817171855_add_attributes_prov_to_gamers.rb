class AddAttributesProvToGamers < ActiveRecord::Migration[5.2]
  def change
    add_column :gamers, :conssole, :string
    add_column :gamers, :gammes, :string
  end
end
