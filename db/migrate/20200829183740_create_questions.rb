class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :query
      t.string :option_a
      t.string :option_b
      t.string :option_c
      t.string :option_d
      t.string :correct_option
      t.integer :quiz_id
      t.integer :started_at_in_epoch
      t.integer :status

      t.timestamps
    end
  end
end
