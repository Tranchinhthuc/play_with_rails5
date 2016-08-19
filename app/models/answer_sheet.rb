class AnswerSheet < ApplicationRecord
  belongs_to :examination
  belongs_to :examinee, class_name: "User"

  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true

  enum answer_sheet_type: {
    listening: 1,
    reading: 2
  }

  scope :index, -> { all }
end
