class Question < ApplicationRecord
  paginates_per 5  
  has_many :answers, dependent: :destroy
  belongs_to :user
end
