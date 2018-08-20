class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :boss, foreign_key: true
      t.references :invite, foreign_key: true
      t.references :match, foreign_key: true
      t.references :challenge, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
