class AddNicknameToGamers < ActiveRecord::Migration[5.2]
  def change
    add_column :gamers, :nickname, :string
  end
end
