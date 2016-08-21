class SubQuestion < ApplicationRecord
  belongs_to :resource, polymorphic: true, optional: true
  has_many :options

  accepts_nested_attributes_for :options

  def hasnt_answer_in? answer_sheet
    !(answer_sheet.answers.map(&:option).map(&:sub_question).include? self)
  end
end
