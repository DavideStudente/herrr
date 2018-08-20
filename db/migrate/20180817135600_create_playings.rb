class CreatePlayings < ActiveRecord::Migration[5.2]
  def change
    create_table :playings do |t|

      t.timestamps
    end
  end
end
