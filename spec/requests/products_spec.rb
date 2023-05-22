require 'swagger_helper'
RSpec.describe 'products_controller', type: :request do
  path '/products' do
    get 'List Products' do
      tags 'Products'
      produces 'application/json'
      parameter name: :page, in: :query, type: :integer, description: 'page number', required: false
      parameter name: :per_page, in: :query, type: :integer, description: 'results per page', require: false
      # request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'
      response '200', 'products listed' do
        let(:page) { 1 }
        let(:per_page){ 1 }

        before{ build(:product).save }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['page']).to eq(1)
          expect(data['per_page']).to eq(1)
          products = data['products']
          expect(products.count).to eq(1)
          product = products.first
          expect(product["code"]).to eq( '123456' )
        end
      end
    end
  end



  path '/products/{code}' do
    get 'Show Product' do
      tags 'Product'
      produces 'application/json'
      parameter name: 'code', in: :path, type: :string, description: 'product code'
      response 200, 'find product' do
        let(:code) { '123456' }
        before{ build(:product).save }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data["code"]).to eq(code)
        end
     
      end
    end
  end
end
