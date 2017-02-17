class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :neighborhood
      t.string :zip_code
      t.string :numb
      t.string :complement
      t.string :city
      t.string :state
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
