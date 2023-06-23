require 'faker'

def generate_username(min_length)
  loop do
    username = Faker::Internet.username
    return username if username.length >= min_length
  end
end
min_length = 8

FactoryBot.define do
  factory :user do |u|
    u.email { Faker::Internet.email }
    u.username { generate_username(min_length) }
    u.name { Faker::Name.name }
    u.password { Faker::Internet.password }
  end
end

