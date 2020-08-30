class Student < ApplicationRecord
  belongs_to :quiz

  def increase_total_points(points)
    self.total_points += points
    save
  end
end
