class AddPasswordDigestToGamers < ActiveRecord::Migration[5.2]
  def change
    add_column :gamers, :password_digest, :string #capitolo6
  end
end
