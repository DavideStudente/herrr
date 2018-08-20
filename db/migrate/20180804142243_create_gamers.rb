class CreateGamers < ActiveRecord::Migration[5.2]
  def change
    create_table :gamers do |t|
      t.string :username
      t.string :email

      t.timestamps
    end
  end
end
