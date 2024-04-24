class Review
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :body, type: String
  field :rate, type: Integer

  belongs_to :product
end
