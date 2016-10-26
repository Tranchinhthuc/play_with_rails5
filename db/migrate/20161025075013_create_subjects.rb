class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :description
      t.string :url
      t.boolean :active

      t.timestamps
    end
  end
end
