class User < ApplicationRecord
    has_many :topics
    has_many :comments
    has_secure_password
end
