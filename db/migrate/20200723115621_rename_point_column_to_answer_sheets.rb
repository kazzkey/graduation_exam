class RenamePointColumnToAnswerSheets < ActiveRecord::Migration[5.2]
  def change
    rename_column :answer_sheets, :point, :score
  end
end
