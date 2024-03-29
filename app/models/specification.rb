class Specification
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :product
end
