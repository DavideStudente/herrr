class AddActivationToGamers < ActiveRecord::Migration[5.2]
  def change
    add_column :gamers, :activation_digest, :string
    add_column :gamers, :activated, :boolean ,default: false
    add_column :gamers, :activated_at, :datetime
  end
end
