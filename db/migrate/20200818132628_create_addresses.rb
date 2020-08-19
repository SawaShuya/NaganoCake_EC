class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id
      t.string :consignee
      t.string :postal_code
      t.string :destination

      t.timestamps
    end
  end
end
