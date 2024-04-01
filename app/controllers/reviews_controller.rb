class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show update destroy]
  before_action :set_product, only: %i[index create]
  include Categoryable

  def index
    @reviews = @product.reviews.all

    render json: @reviews
  end

  def show
    render json: @review
  end

  def create
    @review = Review.new(review_params)
    @review.product = params[:product_id]

    if @review.save
      render json: @review, status: :created,
             location: category_product_review_url(@category, @product, @review)
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    head :no_content
  end

  private

  def set_product
    @product = Category.find(params[:category_id]).products.find(params[:product_id])
  end

  def set_review
    @review = Category.find(params[:category_id])
                      .products.find(params[:product_id])
                      .reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:title, :body, :rate)
  end
end
