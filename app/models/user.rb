class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true
  # validates :password, presence: true
  validates :name, presence: true
  validates :email, presence: true

  has_secure_password

  enum site_role: [:user, :editor, :admin]

  belongs_to :role
  belongs_to :site_role,
              class_name: "Role",
              primary_key: :user_role_id,
              foreign_key: :site_role
   
end