class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :title
      t.boolean :can_change_roles
      t.boolean :can_add_user
      t.boolean :can_delete_user
      t.boolean :can_add_gif
      t.boolean :can_delete_gif
      t.boolean :can_create_roles
      t.boolean :can_delete_roles

      t.timestamps null:false
    end
  end
end
