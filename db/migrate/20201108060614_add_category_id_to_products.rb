class AddCategoryIdToProducts < ActiveRecord::Migration[6.0]
  def self.up
    # add_column :products, :category_id, :integer
    add_index :products, :category_id
  end

  def self.down
    remove_index :products, :column => :category_id
    remove_column :products, :category_id
  end
end
