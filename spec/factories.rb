FactoryGirl.define do
  factory :user do |u|
    sequence(:username) { |n| "mrfoo#{n}"}
    sequence(:email) { |n| "mrfoo#{n}@example.com"}
    password 'super_password!'
    password_confirmation 'super_password!'
  end
end
