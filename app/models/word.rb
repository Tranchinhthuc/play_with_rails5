class Word < ApplicationRecord
  belongs_to :user

  validates :origin, presence: true

  enum status: {
    not_remember_yet: 1,
    remembered: 2
  }

  default_scope { order(created_at: :desc) }
end
