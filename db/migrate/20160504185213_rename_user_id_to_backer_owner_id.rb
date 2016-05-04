class RenameUserIdToBackerOwnerId < ActiveRecord::Migration
  def change
    rename_column :projects, :user_id, :owner_id
    rename_column :pledges, :user_id, :backer_id
  end
end
