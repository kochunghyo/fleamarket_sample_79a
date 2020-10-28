class CreateCatogories < ActiveRecord::Migration[6.0]
  def change
    create_table :catogories do |t|
      t.string :name, null: false
      t.string :ancestry, null: false
      t.timestamps
    end
  end
end
