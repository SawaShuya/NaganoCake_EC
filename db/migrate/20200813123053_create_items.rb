class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.integer :non_taxed_price
      t.string :item_image_id
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
