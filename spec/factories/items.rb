FactoryBot.define do
  factory :item do
    name                    {"abe"}
    explanation             {"abe"}
    price                   {3000}
    category_id             {1}
    condition_id            {1}
    delivery_fee_id         {1}
    shipment_address_id     {46}
    shipping_days_id        {1}

    association :user

  end 
end
