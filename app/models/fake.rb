class Fake
  include Prototype
  include ActiveModel::Model
  include ActiveModel::Serialization
  include ActiveModel::Validations

  attr_accessor :one, :two, :three
end