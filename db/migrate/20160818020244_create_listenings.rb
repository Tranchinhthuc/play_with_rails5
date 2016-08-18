class CreateListenings < ActiveRecord::Migration[5.0]
  def change
    create_table :listenings do |t|

      t.timestamps
    end
  end
end
