class RenameInviteIdToGameIdInInviteRequests < ActiveRecord::Migration[5.2]
  def change
  		rename_column :invite_requests, :invite_id, :team_id
  end
end
