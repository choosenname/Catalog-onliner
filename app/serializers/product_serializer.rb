class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :category_id
end
