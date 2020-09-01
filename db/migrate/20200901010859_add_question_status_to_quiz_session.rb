class AddQuestionStatusToQuizSession < ActiveRecord::Migration[6.0]
  def change
    add_column :quiz_sessions, :question_status, :integer
  end
end
