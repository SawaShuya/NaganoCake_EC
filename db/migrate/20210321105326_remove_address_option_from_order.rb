class RemoveAddressOptionFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :adress_option, :integer
    remove_column :orders, :address_option, :integer
  end
end
