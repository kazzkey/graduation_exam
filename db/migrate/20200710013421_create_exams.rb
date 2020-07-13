class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :title, null: false
      t.date :deadline, null: false
      t.boolean :release, null: false, default: false

      t.timestamps
    end
  end
end
