class AddPointToQuestionAndUser < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :point, :integer
    add_column :users, :point, :integer, default: 0
  end
end
