class AddReferenceToTextsInArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :texts, index: true
  end
end
