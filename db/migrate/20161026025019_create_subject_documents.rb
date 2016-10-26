class CreateSubjectDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_documents do |t|
      t.integer :subject_id
      t.integer :document_id

      t.timestamps
    end
  end
end
