class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :headline
      t.string :image
      t.integer :like, default: 0
      t.integer :no
    end
  end
end
