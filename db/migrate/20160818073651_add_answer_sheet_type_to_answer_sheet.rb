class AddAnswerSheetTypeToAnswerSheet < ActiveRecord::Migration[5.0]
  def change
    add_column :answer_sheets, :answer_sheet_type, :integer
  end
end
