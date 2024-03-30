class Category
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :_id, type: String, default: -> { name }

  has_many :products, dependent: :destroy
end
