module Categoryable
  extend ActiveSupport::Concern

  included do
    before_action :set_category, only: %i[index create]
  end

  private

  def set_category
    @category = Category.find(params[:category_name])
  end
end
