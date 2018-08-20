class AddIndexToGamersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :gamers, :email, unique: true    #PER DARE UNICITÀ ALLA MAIL
  end
end
