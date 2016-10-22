class AddViewsToExamination < ActiveRecord::Migration[5.0]
  def change
    add_column :examinations, :views, :integer, defaul: 0
  end
end
