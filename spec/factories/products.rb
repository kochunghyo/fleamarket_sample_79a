FactoryBot.define do
  factory :product do
    name               {"kotsu"}
    explanation        {"fff"}
    price              {400}
    status_id          {1}
    category_id        {1}
    shipping_day_id    {1}
    shipping_area_id   {1}
    delivery_fee_id    {1}
    after(:build) do |product|
      product.images << FactoryBot.build(:image, product_id: product.id)
    end
  end

  factory :category do
    name               {"food"}
  end

  factory :status do
    name               {"good"}
  end

  factory :shipping_day do
    name               {"3"}
  end

  factory :shipping_area do
    name               {"fukuoka"}
  end

  factory :delivery_fee do
    name               {"500"}
  end

end