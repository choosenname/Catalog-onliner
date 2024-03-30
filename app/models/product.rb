class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  embeds_many :specifications
  has_many :reviews, dependent: :destroy
  belongs_to :category
end
