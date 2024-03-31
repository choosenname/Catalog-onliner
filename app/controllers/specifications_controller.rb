class SpecificationsController < ApplicationController
  before_action :set_specification, only: %i[ show update destroy ]
  before_action :set_product, only: %i[ index create ]

  def index
    @specifications = @product.specifications.all

    render json: @specifications
  end

  def show
    render json: @specification
  end

  def update
    if @specification.update(specification_params)
      render json: @specification
    else
      render json: @specification.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @specification.destroy
    head :no_content
  end

  private

  def set_product
    @product = Category.find(params[:category_id]).products.find(params[:product_id])
  end

  def set_specification
    @specification = Category.find(params[:category_id])
                             .products.find(params[:product_id])
                             .specifications.find(params[:id])
  end
end
