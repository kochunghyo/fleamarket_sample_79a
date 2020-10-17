class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :explanation
      t.integer :price
      
      t.timestamps null: false
    end
  end
end
