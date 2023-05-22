FactoryBot.define do
  factory :product do
    code { '123456' }
    barcode { '123456(EA/EA13)' }
    status { 'imported' }
    imported_t { DateTime.now }
    url { 'http://example.com/product/1' }
    product_name { 'shampoo' }
    quantity { '500g' }
    packaging { 'plastic bottle' }
    image_url { 'http://example.com/img/1'}
    brands { 'new brand, cool brand' }
    categories { 'personal higene, hair care' }
  end
end