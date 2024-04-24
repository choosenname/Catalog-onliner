class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :rate, :product_id
end
