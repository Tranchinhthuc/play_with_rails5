class Question < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :sub_questions
  has_many :examinations, through: :examination_questions
  has_many :examination_questions

  scope :index, -> { all }

  enum approved_status: {
    waiting: 1,
    denied: 2,
    approved: 3
  }

  def correct_option_s
    # SysConst::PART_1_2_OPTIONS.key(correct_option)
  end

  def label_text
    " Question #{id}"
  end

  def level_s
    SysConst::QUESTION_LEVELS_TO_S[SysConst::QUESTION_LEVELS.key(level)]
  end
end
