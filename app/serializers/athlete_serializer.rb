class AthleteSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :birthdate
end
