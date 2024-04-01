require 'swagger_helper'

RSpec.describe 'reviews', type: :request do

  path '/categories/{category_name}/products/{product_id}/reviews' do
    parameter name: 'category_name', in: :path, type: :string, description: 'category_name'
    parameter name: 'product_id', in: :path, type: :string, description: 'product_id'

    get('list reviews') do
      tags 'Review'
      consumes 'application/json'
      response(200, 'successful') do

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

    post('create review') do
      tags 'Review'
      consumes 'application/json'
      parameter name: :review, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          rate: { type: :integer }
        },
        required: %w[title body rate]
      }

      response '201', 'review created' do
        let(:review) { { title: 'foo', body: 'test', rate: 1, product_id: '123' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:review) { { title: 'foo', body: 'test', rate: 1, product_id: '123' } }
        run_test!
      end

      response(200, 'successful') do

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

  path '/categories/{category_name}/products/{product_id}/reviews/{id}' do
    parameter name: 'category_name', in: :path, type: :string, description: 'category_name'
    parameter name: 'product_id', in: :path, type: :string, description: 'product_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show review') do
      tags 'Review'
      consumes 'application/json'
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

    patch('update review') do
      tags 'Review'
      consumes 'application/json'
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

    put('update review') do
      tags 'Review'
      consumes 'application/json'
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

    delete('delete review') do
      tags 'Review'
      consumes 'application/json'
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
