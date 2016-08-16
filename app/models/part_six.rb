class PartSix < Question
  has_many :sub_questions, as: :resource, dependent: :destroy

  accepts_nested_attributes_for :sub_questions

  scope :index, -> { all }
end
