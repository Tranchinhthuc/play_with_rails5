class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :book_link
      t.string :audio_link
      t.integer :audio_point
      t.integer :book_point
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
