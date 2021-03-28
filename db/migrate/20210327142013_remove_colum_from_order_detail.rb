class RemoveColumFromOrderDetail < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_details, :non_taxed_price, :integer
    add_column :order_details, :taxed_price, :integer
  end
end
