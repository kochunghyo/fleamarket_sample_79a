FactoryBot.define do
  
  factory :user do
    nickname                 {"aya"}
    email                    {"aaa@gmail.com"}
    password                 {"0000000"}
    encrypted_password       {"0000000"}
    last_name                {"山田"}
    first_name               {"彩"}
    last_name_kana           {"ヤマダ"}
    first_name_kana          {"アヤ"}
    birthday                 {"2000-1-1"}
  end
end