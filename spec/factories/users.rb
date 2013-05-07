FactoryGirl.define do
  factory :user do
    username 'panera'
    email 'pan@er.a'
    password 'panera'
    password_confirmation 'panera'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end