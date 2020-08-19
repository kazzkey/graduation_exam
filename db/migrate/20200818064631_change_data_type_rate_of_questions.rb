class ChangeDataTypeRateOfQuestions < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :rate, :numeric
  end
end
