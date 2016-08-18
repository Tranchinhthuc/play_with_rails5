class AddCountOfSubQuestionToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :count_of_sub_questions, :integer
    add_column :questions, :explanation, :text
  end
end
