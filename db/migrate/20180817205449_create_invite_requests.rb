class CreateInviteRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :invite_requests do |t|

      t.timestamps
    end
  end
end
