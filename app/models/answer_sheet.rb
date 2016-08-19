class AnswerSheet < ApplicationRecord
  belongs_to :examination
  belongs_to :examinee, class_name: "User"

  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers

  enum answer_sheet_type: {
    listening: 1,
    reading: 2
  }

  scope :index, -> { all }
end
