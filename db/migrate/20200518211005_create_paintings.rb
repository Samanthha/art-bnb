class CreatePaintings < ActiveRecord::Migration[6.0]
  def change
    create_table :paintings do |t|
      t.string :name
      t.string :category
      t.string :painter
      t.string :location
      t.integer :price_per_day
      t.string :dimensions
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
