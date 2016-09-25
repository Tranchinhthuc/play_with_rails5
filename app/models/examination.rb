class Examination < ApplicationRecord
  has_many :questions, through: :examination_questions
  has_many :examination_questions
  has_many :answer_sheets
  belongs_to :creator, class_name: "User"

  enum examination_type: {
    reading_lesson: 1,
    listening_lesson: 2,
    part_one_lesson: 3,
    part_two_lesson: 4,
    part_three_lesson: 5,
    part_four_lesson: 6,
    part_five_lesson: 7,
    part_six_lesson: 8,
    part_seven_one_lesson: 9,
    part_seven_two_lesson: 10
  }

  scope :index, -> { all }
  scope :part_one_lessons, -> { where examination_type: :part_one_lesson }
  scope :part_two_lessons, -> { where examination_type: :part_two_lesson }
  scope :part_three_lessons, -> { where examination_type: :part_three_lesson }
  scope :part_four_lessons, -> { where examination_type: :part_four_lesson }
  scope :part_five_lessons, -> { where examination_type: :part_five_lesson }
  scope :part_six_lessons, -> { where examination_type: :part_six_lesson }
  scope :part_seven_one_lessons, -> { where examination_type: :part_seven_one_lesson }
  scope :part_seven_two_lessons, -> { where examination_type: :part_seven_two_lesson }
  scope :reading_lessons, -> { where examination_type: :reading_lesson }
  scope :listening_lessons, -> { where examination_type: :listening_lesson }
  scope :half_test, -> { where examination_type: [:listening_lesson, :reading_lesson]}

  def examination_type_s
    SysConst::LESSON_TYPE_TO_STRING[examination_type.to_sym]
  end
end
