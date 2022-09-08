FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"abcd1234"}
    password_confirmation {password}
    first_name            {"一郎"}
    family_name           {"鈴木"}
    first_name_kana       {"イチロウ"}
    family_name_kana      {"スズキ"}
    birth                 {20001212}
  end
end