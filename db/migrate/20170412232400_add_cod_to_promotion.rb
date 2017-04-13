class AddCodToPromotion < ActiveRecord::Migration[5.0]
  def change
    add_column :promotions, :cod, :string
  end
end
