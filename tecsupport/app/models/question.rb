class Question < ApplicationRecord
  paginates_per 5
  has_one_attached :image  
  has_many :answers, dependent: :destroy
  belongs_to :user
end
