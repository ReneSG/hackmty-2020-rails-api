class QuizSession < ApplicationRecord
  has_many :students
  belongs_to :quiz

  enum status: [:active, :done]
end
