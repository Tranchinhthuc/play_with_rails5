class Option < ApplicationRecord
  belongs_to :sub_question, optional: true
  has_many :answers

  def choosen_option_in answer_sheet
    answer = answers.find_by(answer_sheet: answer_sheet)
    {
      choosen: answer.present?,
      correct: answer.present? ? correct? : false
    }
  end
end
