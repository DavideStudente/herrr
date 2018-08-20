class AddColumnToInviteRequest < ActiveRecord::Migration[5.2]
  def change
  	add_column :invite_requests, :invite_id, :integer
    add_column :invite_requests, :gamer_id, :integer
  end
end
