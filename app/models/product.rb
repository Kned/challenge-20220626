class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  validates_uniqueness_of :code

  field :code, type: String
  field :barcode, type: String
  field :status, type: StatusMapping
  field :imported_t, type: DateTime
  field :url, type: String
  field :product_name, type: String
  field :quantity, type: String
  field :packaging, type: String
  field :image_url, type: String
  field :brands, type: String
  field :categories, type: String
end
