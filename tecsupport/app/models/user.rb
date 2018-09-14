class User < ApplicationRecord
    paginates_per 5
    has_secure_password
     has_many :answers
     has_many :questions, dependent: :destroy

    validates :username, presence: true, uniqueness: true
end
