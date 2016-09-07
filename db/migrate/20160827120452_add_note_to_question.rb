class AddNoteToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :note, :string
  end
end
