class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.integer :professor_id

      t.timestamps
    end
  end
end
