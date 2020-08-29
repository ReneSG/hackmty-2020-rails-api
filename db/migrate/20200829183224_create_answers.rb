class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :selection
      t.string :question_id
      t.string :student_id
      t.integer :points_awarded

      t.timestamps
    end
  end
end
