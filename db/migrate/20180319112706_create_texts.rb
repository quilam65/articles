class CreateTexts < ActiveRecord::Migration[5.1]
  def change
    create_table :texts do |t|
      t.string :headline
      t.integer :no
      t.integer :like, default: 0
      t.text :content
    end
  end
end
