class CreateReadingQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :reading_questions do |t|
      t.integer :reading_id
      t.integer :question_id

      t.timestamps
    end
  end
end
