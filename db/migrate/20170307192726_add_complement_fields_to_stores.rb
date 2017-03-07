class AddComplementFieldsToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :social_name, :string
    add_column :stores, :fantasy_name, :string
    add_column :stores, :cnpj, :string
    add_column :stores, :phone, :string
  end
end
