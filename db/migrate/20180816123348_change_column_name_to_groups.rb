class ChangeColumnNameToGroups < ActiveRecord::Migration[5.2]
  def change
      rename_column :groups, :members_id, :member_id
  end
end
