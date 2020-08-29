class Quiz < ApplicationRecord
  belongs_to :professor
  has_many :questions
  has_many :students

  accepts_nested_attributes_for :questions

end
