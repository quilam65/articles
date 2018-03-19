class AddReferenceToImagesInArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :images, index: true
  end
end
