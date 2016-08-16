class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  [:questions, :part_ones, :part_twos, :part_threes, :part_fours, :part_fives, :part_sixes, :part_seven_ones, :part_seven_twos, :examinations].each do |object|
    has_many object, foreign_key: "creator_id"
  end

  has_many :answer_sheets, foreign_key: "examinee_id"

  scope :index, -> { all }

  enum role: {
    admin: 1,
    normal: 2
  }

  def admin?
    role == "admin"
  end
end
