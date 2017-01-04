class AddUserRoleIdToRoles < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :user_role_id, :integer
  end
end
