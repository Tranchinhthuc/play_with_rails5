class Examination < ApplicationRecord
  has_many :questions, through: :examination_questions
  has_many :examination_questions
  has_many :answer_sheets
  belongs_to :listening
  belongs_to :reading
  belongs_to :creator, class_name: "User"

  scope :index, -> { all }
end
