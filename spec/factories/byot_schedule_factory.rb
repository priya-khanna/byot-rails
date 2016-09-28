require 'factory_girl'

FactoryGirl.define do
  factory :byot_schedule do
    byot_at Time.zone.now + 3.day
    window_opens_at "2015-07-01 00:00:00"
    window_closes_at "2015-12-01 00:00:00"
    status "open"
  end
end