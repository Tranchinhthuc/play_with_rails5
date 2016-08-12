class PartSevenOne < Question
  scope :index, -> { all }
  has_many :sub_questions, as: :resource, dependent: :destroy
  accepts_nested_attributes_for :sub_questions, reject_if: :all_blank, allow_destroy: true
end
