class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :pin
      t.string :serial
      t.integer :user_id
      t.integer :money
      t.string :card_type
      t.string :status

      t.timestamps
    end
  end
end
