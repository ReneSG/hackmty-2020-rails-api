class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers

  enum status: [:active, :done, :pending]
end
