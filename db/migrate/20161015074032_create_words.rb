class CreateWords < ActiveRecord::Migration[5.0]
  def change
    create_table :words do |t|
      t.integer :user_id
      t.string :origin
      t.string :meaning
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
