class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :content, null: false
      t.string :image
      t.integer :correct_answer, null: false
      t.string :description
      t.integer :rate
      t.references :exam, foreign_key: true

      t.timestamps
    end
  end
end
