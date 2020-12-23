FactoryBot.define do
  factory :order_form do
    postcode               {"000-0000"}
    shipment_address_id    {46}
    municipality           {"市区町村"}
    address                {"123456"}
    house_number           {"ビル名"}
    phone_number           {"00000000000"}
    token                  {"tok_abcdefghijk00000000000000000"}
    user {create{:user}}
    item {create{:item}}
  end
end
