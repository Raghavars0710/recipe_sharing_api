FactoryBot.define do
    factory :user do
      name { Faker::Name.name }
      username { Faker::Internet.username }
      role { 'admin' }
      email { Faker::Internet.email }
      password { '123456' }
      password_confirmation { '123456' }
    end
end