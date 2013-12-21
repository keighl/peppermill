FactoryGirl.define do

  factory :user do |u|
    sequence(:username) { |n| "mrfoo#{n}"}
    sequence(:email) { |n| "mrfoo#{n}@example.com"}
    password 'super_password!'
    password_confirmation 'super_password!'
  end

  factory :todo do |u|
    association :user
    name 'Buy some frickin'
  end

  factory :completed_todo do |u|
    association :user
    name 'Buy some frickin groceries'
    complete true
  end
end


