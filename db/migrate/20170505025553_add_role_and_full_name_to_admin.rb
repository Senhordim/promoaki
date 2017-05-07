class AddRoleAndFullNameToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :role, :integer
    add_column :admins, :full_name, :string
  end
end
