class Quiz < ApplicationRecord
  belongs_to :professor
  has_many :questions
  has_many :students

  accepts_nested_attributes_for :questions

  def active_question
    self.questions.active.first
  end

  def next_question
    return nil if self.questions.pending.count == 0
    return self.questions.pending.first
  end
end
