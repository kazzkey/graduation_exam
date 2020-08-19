class CreateExamQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_questions do |t|
      t.references :exam, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
