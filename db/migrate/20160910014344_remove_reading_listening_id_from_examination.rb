class RemoveReadingListeningIdFromExamination < ActiveRecord::Migration[5.0]
  def change
    remove_column :examinations, :reading_id
    remove_column :examinations, :listening_id
  end
end
