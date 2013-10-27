FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@logeek.fr" }
    password 'yikes99!'
  end
end