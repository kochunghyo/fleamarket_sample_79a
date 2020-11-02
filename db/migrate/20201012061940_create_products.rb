class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :price, null: false
      t.bigint :user, null: false, foreign_key: true
      t.bigint :category_id, null: false, foreign_key: true
      t.bigint :brand_id, foreign_key: true
      t.timestamps null: false
    end
  end
end
