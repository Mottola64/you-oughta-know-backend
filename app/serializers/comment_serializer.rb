class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :topic_id, :user_id
  
  belongs_to :topic
  belongs_to :user
end
