class Quiz < ApplicationRecord
  belongs_to :professor
  has_many :questions
end
