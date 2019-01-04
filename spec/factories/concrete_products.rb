FactoryBot.define do
  factory :concrete_product do
    trait :required_fields do
      price { 100.00 }
      size { 'S' }
      color { '#000000' }
      amount { 1 }
    end
  end
end
