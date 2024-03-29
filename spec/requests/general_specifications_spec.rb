require 'swagger_helper'

RSpec.describe 'general_specifications', type: :request do

  path '/general_specifications' do

    get('list general_specifications') do
      tags 'General Specification'
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

    post('create general_specification') do
      tags 'General Specification'
      consumes 'application/json'
      parameter name: :general_specification, in: :body, schema: {
        type: :object,
        properties: {
          release_date: { type: :string },
          general: { type: :string },
          product_id: { type: :string }
        },
        required: %w[release_date general product_id]
      }

      response '201', 'general specification created' do
        let(:general_specification) { { release_date: 'foo', general: 'test', product_id: '123' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:general_specification) { { release_date: 'foo', general: 'test', product_id: '123' } }
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

  path '/general_specifications/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show general_specification') do
      tags 'General Specification'
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

    patch('update general_specification') do
      tags 'General Specification'
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

    put('update general_specification') do
      tags 'General Specification'
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

    delete('delete general_specification') do
      tags 'General Specification'
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
