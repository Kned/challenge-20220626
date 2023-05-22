require 'swagger_helper'
RSpec.describe 'products_controller', type: :request do
  path '/products?page={page}&per_page={per_page}' do
    get 'List Products' do
      tags 'Products'
      produces 'application/json'
      parameter name: :page, in: :path, type: :integer, description: 'page number'
      parameter name: :per_page, in: :path, type: :integer, description: 'results per page'
      request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'
      response '200', 'products listed' do
        let(:product) { { page: 1, per_page: 1 } }
        run_test!
      end
    end
  end



  path '/products/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show product') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
