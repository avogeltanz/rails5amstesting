class TestModelSerializer < ActiveModel::Serializer
  attributes :id, :one, :three

  has_many :test_sub_models
end
