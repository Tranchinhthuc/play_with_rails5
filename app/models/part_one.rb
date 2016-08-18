class PartOne < Question
  mount_uploader :audio, AudioUploader
  mount_uploader :photo, PhotoUploader

  # validates :correct_option, presence: true
  validates :audio, presence: true
  validates :photo, presence: true

  has_many :sub_questions, as: :resource, dependent: :destroy

  accepts_nested_attributes_for :sub_questions

  scope :index, -> { all }
end
