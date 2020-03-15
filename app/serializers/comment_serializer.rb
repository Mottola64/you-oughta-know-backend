class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :topic_id
end
