class PartSevenOne < Question
  has_many :sub_questions, as: :resource, dependent: :destroy
  accepts_nested_attributes_for :sub_questions, reject_if: :all_blank, allow_destroy: true

  scope :index, -> { all }
  scope :has_two_sub_questions, -> { where count_of_sub_questions: 2 }
  scope :has_three_sub_questions, -> { where count_of_sub_questions: 3 }
  scope :has_four_sub_questions, -> { where count_of_sub_questions: 4 }
  scope :has_five_sub_questions, -> { where count_of_sub_questions: 5 }

  def self.for_standard_examination
    has_two_sub_questions.sample(2) + has_three_sub_questions.sample(5) + has_four_sub_questions.sample(1) + has_five_sub_questions.sample(1)
  end
end
