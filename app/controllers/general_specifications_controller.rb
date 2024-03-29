class GeneralSpecificationsController < SpecificationsController
  def create
    @product = Product.find(params[:product_id])
    @general_specification = @product.general_specifications.new(general_specification_params)

    if @general_specification.save
      render json: @general_specification, status: :created, location: @general_specification
    else
      render json: @general_specification.errors, status: :unprocessable_entity
    end
  end

  private

  def general_specification_params
    params.require(:general_specification).permit(:release_date, :general)
  end
end
