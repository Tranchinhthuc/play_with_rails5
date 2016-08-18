class Listening < ApplicationRecord
  has_many :questions, through: :listening_questions
  has_many :listening_questions
  has_many :examinees, class_name: "AnswerSheet", foreign_key: "examinee_id"
  has_many :answer_sheets
  has_many :examinations

  scope :index, -> { all }

  def self.build_auto
    part_ones = PartOne.all.sample(10)
    part_twos = PartTwo.all.sample(30)
    part_threes = PartThree.all.sample(30)
    part_fours = PartFour.all.sample(30)
    questions = part_ones + part_twos + part_threes + part_fours
    Listening.new(questions: questions)
  end
end
