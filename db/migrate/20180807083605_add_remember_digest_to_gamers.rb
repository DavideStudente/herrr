class AddRememberDigestToGamers < ActiveRecord::Migration[5.2]
  def change
    add_column :gamers, :remember_digest, :string
  end
end
