class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category, :user_id
end
