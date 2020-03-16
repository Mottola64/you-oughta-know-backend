class TopicSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category
  
  # , :user_id

  # has_many :comments
end
