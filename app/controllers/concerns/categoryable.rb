module Categoryable
  extend ActiveSupport::Concern

  included do
    before_action :set_category, only: %i[index create]
  end

  private

  def set_category
    @category = Category.find_by(name: params[:category_name])
  end
end
