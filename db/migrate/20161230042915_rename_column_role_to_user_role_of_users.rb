class RenameColumnRoleToUserRoleOfUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.rename :role, :site_role
    end
  end
end
