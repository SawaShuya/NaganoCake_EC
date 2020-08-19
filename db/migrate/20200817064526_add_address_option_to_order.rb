class AddAddressOptionToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :adress_option, :integer
  end
end
