class Reading < ApplicationRecord
  has_many :questions, through: :reading_questions
  has_many :reading_questions
  has_many :examinees, class_name: "AnswerSheet", foreign_key: "examinee_id"
  has_many :answer_sheets
  has_many :examinations

  scope :index, -> { all }

  def self.build_auto
    part_fives = PartFive.all.sample(40)
    part_sixes = PartSix.all.sample(4)
    part_seven_ones = PartSevenOne.for_standard_examination
    part_seven_twos = PartSevenTwo.all.sample(4)
    questions = part_fives + part_sixes + part_seven_ones + part_seven_twos
    Reading.new(questions: questions)
  end
end
