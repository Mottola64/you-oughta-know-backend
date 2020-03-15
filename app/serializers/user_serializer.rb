class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username

  has_many :topics
  has_many :comments, through: :topics
end
