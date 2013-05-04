FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'test@test.com'
    password 'test'
    password_confirmation 'test'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end