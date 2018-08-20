class AddConsoleGameDescriptionToTeam < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :description, :text
    add_column :teams, :console, :string
    add_reference :teams, :game, foreign_key: true
  end
end
