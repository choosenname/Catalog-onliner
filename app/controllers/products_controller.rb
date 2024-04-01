class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]
  include Categoryable


  def index
    @products = @category.products.all

    render json: @products
  end

  def show
    render json: @product, include: :reviews
  end

  def create
    @product = Product.new(product_params)
    @product.category = @category._id

    if @product.save
      render json: @product, status: :created, location: category_product_url(@category, @product)
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name)
  end
end
