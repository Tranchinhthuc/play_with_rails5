class AddApprovedStatusToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :approved_status, :integer
  end
end
