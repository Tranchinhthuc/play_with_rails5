class CreateExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :examinations do |t|
      t.integer :creator_id
      t.integer :reading_id
      t.integer :listening_id

      t.timestamps
    end
  end
end
