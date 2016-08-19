class Answer < ApplicationRecord
  belongs_to :answer_sheet
  belongs_to :option

  scope :index, -> { all }

  def correct?
    option.correct
  end
end
