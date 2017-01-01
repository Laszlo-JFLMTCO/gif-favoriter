# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Role.destroy_all


admin_role = Role.create(
  title: "admin",
  can_change_roles: true,
  can_add_user: true,
  can_delete_user: true,
  can_add_gif: true,
  can_delete_gif: true,
  can_create_roles: true,
  can_delete_roles: true,
  user_role_id: 2
)

editor_role = Role.create(
  title: "editor",
  can_change_roles: false,
  can_add_user: false,
  can_delete_user: false,
  can_add_gif: true,
  can_delete_gif: true,
  can_create_roles: false,
  can_delete_roles: false,
  user_role_id: 1
)

user_role = Role.create(
  title: "user",
  can_change_roles: false,
  can_add_user: false,
  can_delete_user: false,
  can_add_gif: false,
  can_delete_gif: false,
  can_create_roles: false,
  can_delete_roles: false,
  user_role_id: 0
)

admin = User.new(
  username: "admin",
  name: "admin",
  email: "admin",
  password: "admin"
)

admin.role = admin_role
admin.save

user1 = User.new(
  username: "test1",
  name: "test1",
  email: "test1",
  password: "test1",
)

user1.role = editor_role
user1.save
