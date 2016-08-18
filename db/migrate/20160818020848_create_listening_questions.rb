class CreateListeningQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :listening_questions do |t|
      t.integer :listening_id
      t.integer :question_id

      t.timestamps
    end
  end
end
