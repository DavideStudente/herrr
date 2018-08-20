class AddResetToGamers < ActiveRecord::Migration[5.2]
  def change
    add_column :gamers, :reset_digest, :string
    add_column :gamers, :reset_sent_at, :datetime
  end
end
