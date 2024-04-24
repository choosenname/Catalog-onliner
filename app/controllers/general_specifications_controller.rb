class GeneralSpecificationsController < SpecificationsController

  def create
    @general_specification = @product.specifications.build(general_specification_params)

    if @general_specification.save
      render json: @general_specification, status: :created,
             location: category_product_general_specification_url(@category, @product, @general_specification)
    else
      render json: @general_specification.errors, status: :unprocessable_entity
    end
  end

  def update
    if @specification.update(general_specification_params)
      render json: @specification
    else
      render json: @specification.errors, status: :unprocessable_entity
    end
  end

  private

  def general_specification_params
    params.require(:general_specification).permit(:release_date, :general)
  end
end
