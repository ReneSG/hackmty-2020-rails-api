class CreateQuizSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :quiz_sessions do |t|
      t.integer :quiz_id
      t.integer :status

      t.timestamps
    end
  end
end
