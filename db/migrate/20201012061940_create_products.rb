class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.string :brand
      t.integer :price, null: false
      t.bigint :category_id, null: false, foreign_key: true
      t.bigint :status_id, null: false, foreign_key: true
      t.bigint :delivery_fee_id, null: false, foreign_key: true
      t.bigint :shipping_area_id, null: false, foreign_key: true
      t.bigint :shipping_day_id, null: false, foreign_key: true
      t.bigint :buyer_id, foreign_key: true
      # t.bigint :seller_id, foreign_key: true
      t.references :seller, null:false, foreign_key: { to_table: :users }
      t.timestamps null: false
    end
  end
end
