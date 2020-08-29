class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :username
      t.string :identifier
      t.integer :quiz_id

      t.timestamps
    end
  end
end
