class Role < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true

  # has_many :users, class_name: "User", primary_key: :user_role_id, foreign_key: :role

end