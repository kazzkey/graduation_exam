class CreateAnswerSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_sheets do |t|
      t.integer :point, null: false
      t.references :user, foreign_key: true
      t.references :exam, foreign_key: true
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
