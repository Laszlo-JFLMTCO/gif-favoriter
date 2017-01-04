FactoryGirl.define do
  factory :role do
    sequence :title, ["admin", "editor", "user"].cycle do |n|
      "#{n}"
    end
    sequence :can_change_roles, ["true", "false", "false"].cycle do |n|
      "#{n}"
    end
    sequence :can_add_user, ["true", "false", "false"].cycle do |n|
      "#{n}"
    end
    sequence :can_delete_user, ["true", "false", "false"].cycle do |n|
      "#{n}"
    end
    sequence :can_add_gif, ["true", "true", "false"].cycle do |n|
      "#{n}"
    end
    sequence :can_delete_gif, ["true", "true", "false"].cycle do |n|
      "#{n}"
    end
    sequence :can_create_roles, ["true", "false", "false"].cycle do |n|
      "#{n}"
    end
    sequence :can_delete_roles, ["true", "false", "false"].cycle do |n|
      "#{n}"
    end
    sequence :user_role_id, [2, 1, 0].cycle do |n|
      "#{n}"
    end
    # factory :user_with_role do
    #   after(:build) do |role|
    #     create_list(:user, site_role: role, role: role)
    #   end
    # end
  end

  # factory :user do
  #   sequence :username, ["admin", "test1"].cycle do |n|
  #     "#{n}"
  #   end
  #   sequence :name, ["admin", "test1"].cycle do |n|
  #     "#{n}"
  #   end
  #   sequence :email, ["admin", "test1"].cycle do |n|
  #     "#{n}"
  #   end
  #   sequence :password, ["admin", "test1"].cycle do |n|
  #     "#{n}"
  #   end

  #   # factory :user_with_role do
  #   #   after(:create) do |role|
  #   #     create_list(:user, site_role: role, role: role)
  #   #   end
  #   # end
  # end
end