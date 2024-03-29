class GeneralSpecification
  include Mongoid::Document
  include Mongoid::Timestamps
  field :release_date, type: Date
  field :general, type: String
end
