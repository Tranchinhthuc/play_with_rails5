class CreateBuyerExaminations < ActiveRecord::Migration[5.0]
  def change
    create_table :buyer_examinations do |t|
      t.integer :buyer_id
      t.integer :examination_id

      t.timestamps
    end
  end
end
