class BuyerExamination < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :examination
end
