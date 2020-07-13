class AddSubjectRefToExams < ActiveRecord::Migration[5.2]
  def change
    add_reference :exams, :subject, foreign_key: true
  end
end
