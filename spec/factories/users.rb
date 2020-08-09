FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6, mix_case: true)
    password { password }
    password_confirmation { password }
    first_name { Faker::Japanese::Name.first_name }
    last_name { Faker::Japanese::Name.last_name }
    first_name_reading { Faker::Japanese::Name.first_name.yomi }
    last_name_reading { Faker::Japanese::Name.last_name.yomi }
    birthday { Faker::Date.birthday }
  end
end
