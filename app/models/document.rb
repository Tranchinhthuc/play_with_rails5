class Document < ApplicationRecord
  has_many :subjects, through: :subject_documents
  has_many :subject_documents
  belongs_to :user

  scope :index, -> { all }
end
