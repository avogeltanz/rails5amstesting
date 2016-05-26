class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :tone
end
