class User < ApplicationRecord
    has_many :topics
    has_many :comments, through: :topics
    has_secure_password
end
