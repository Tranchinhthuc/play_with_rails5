class CreateAnswerSheets < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_sheets do |t|
      t.integer :examination_id
      t.integer :examinee_id

      t.timestamps
    end
  end
end
