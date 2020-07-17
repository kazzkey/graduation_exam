class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :choice, null: false
      t.references :answer_sheet, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
