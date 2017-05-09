class AddDistanceToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :distance, :decimal
  end
end
