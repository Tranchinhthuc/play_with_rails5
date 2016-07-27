class Article < ApplicationRecord
  # has_attached_file :article_photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :article_photo, content_type: /\Aimage\/.*\Z/
  has_attached_file :article_photo
end
