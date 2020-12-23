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
    item_id {Factory.create(:item)}
    association :user

  end 
end
