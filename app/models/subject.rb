class Subject < ApplicationRecord
  has_many :documents, through: :subject_documents
  has_many :subject_documents

  scope :index, -> { all }

  def url_s
    url.present? ? url : "root_path"
  end
end
