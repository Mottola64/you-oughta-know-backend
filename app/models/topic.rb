class Topic < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :title, :description, :category, presence: true
end
