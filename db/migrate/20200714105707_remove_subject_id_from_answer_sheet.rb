class RemoveSubjectIdFromAnswerSheet < ActiveRecord::Migration[5.2]
  def change
    remove_reference :answer_sheets, :subject, foreign_key: true
  end
end
