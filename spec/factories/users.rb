FactoryGirl.define do
  factory :user do
    user_id ""
    first_name ""
    last_name ""
    email ""
    password_digest ""
    admin false
  end
end
