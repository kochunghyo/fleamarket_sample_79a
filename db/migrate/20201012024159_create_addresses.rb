class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code,    null:false
      t.string :city,         null:false
      t.string :house_number, null:false
      t.string :building
      t.string :phone_number
      t.references :user,     null:false
      t.integer :prefecture_id
      t.timestamps
    end
  end
end
