class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
    	t.integer :end_user_id
		t.integer :payment_method, null: false, default: 0
		t.integer :status, null: false, default: 0
		t.integer :postage
		t.integer :total_payment
		t.string :consignee
		t.string :postal_code
		t.string :destination_address

      t.timestamps
    end
  end
end
