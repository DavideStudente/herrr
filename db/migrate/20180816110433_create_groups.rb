class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :region
      t.string :console
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
