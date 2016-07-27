class AddArticlePhotoToArtcile < ActiveRecord::Migration[5.0]
  def up
    add_attachment :articles, :article_photo
  end

  def down
    remove_attachment :articles, :article_photo
  end
end
