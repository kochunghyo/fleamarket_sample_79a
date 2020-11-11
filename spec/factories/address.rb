FactoryBot.define do
  
  factory :address do
    post_code            {815-1234}
    city                 {"福岡市"}
    house_number         {1234567}
    user_id              {1}
    prefecture_id        {1}
  end

end