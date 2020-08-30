class Student < ApplicationRecord
  belongs_to :quiz_session

  def increase_total_points(points)
    self.total_points += points
    save
  end
end
