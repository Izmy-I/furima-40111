FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + '11' }
    password_confirmation { password }
    first_name            { "太郎" }
    last_name             { "山田" }
    first_name_kana       { "タロウ" }
    last_name_kana        { "ヤマダ" }
    birth_day             { Faker::Date.birthday }
  end
end