class CreatePromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :promotions do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.date :endDate
      t.references :segment, foreign_key: true
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
