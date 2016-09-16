class AddExaminationTypeToExamination < ActiveRecord::Migration[5.0]
  def change
    add_column :examinations, :examination_type, :integer
  end
end
