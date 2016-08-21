class PartTwo < Question
  mount_uploader :audio, AudioUploader

  validates :audio, presence: true

  has_many :sub_questions, as: :resource, dependent: :destroy

  accepts_nested_attributes_for :sub_questions

  scope :index, -> { all }
end
