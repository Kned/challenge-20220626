class ImportService
  require 'open-uri'

  def import
    import_count = 0
    import_max = 100
    max_pages = 2
    page = 1
    while max_pages >= page
      url = "https://world.openfoodfacts.org/language/multilingual.json&page=#{page}&fields=code,product_name,image_url,url,quantity,packaging,categories,brands"
      import_json = JSON.parse(Nokogiri::HTML(URI.open(url)).content)
      products = import_json['products']
      max_pages = import_json['page_count']
      products.each do |product|
        return true if import_count == import_max
  
        import_count += 1
        next if Product.where(code: product['code']).count > 0

        new_product = Product.create(product_attributes(product))
        new_product.update(product_updated_attributes(new_product.url))
      end
      page += 1
    end
  end

  def update
    updated_count = 0
    Product.each do |product|
      url = "https://world.openfoodfacts.org/api/v2/search?code=#{product.code}&fields=code,product_name,image_url,url,quantity,packaging,categories,brands"
      import_json = JSON.parse(Nokogiri::HTML(URI.open(url)).content)
      prod = import_json['products'].first
      product.update(product_attributes(prod))
      product.update(product_updated_attributes(product.url))
      updated_count += 1
      puts "Imported: #{updated_count}"
    end
  end
  private

  def product_attributes(product)
    {
      code: product['code'],
      status: "draft",
      url: "https://world.openfoodfacts.org/product/#{product['code']}",
      product_name: product['product_name'],
      image_url: product['image_front_url'],
      quantity: product['quantity'],
      packaging: product['packaging'],
      categories: product['categories'],
      brands: product['brands']
    }
  end

  def product_updated_attributes(new_product_url)
    document = Nokogiri::HTML(URI.open(new_product_url))
    {
      barcode: document.css('#barcode_paragraph').first.content.strip.gsub("Barcode:  ",""),
      status: "imported",
      imported_t: DateTime.now,
    }
  end
end
