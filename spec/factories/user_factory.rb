require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "Byot user #{i}"}
    sequence(:email) { |i| "test#{i}@example.com" }
    password "password"
    password_confirmation "password"
  end
end