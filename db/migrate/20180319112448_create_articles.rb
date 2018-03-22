class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.datetime :date_up
      t.integer :like, default: 0
    end
  end
end
