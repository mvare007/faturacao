class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :unit_price
      t.string :code
      t.text :description
      t.references :product_status, null: false, foreign_key: true
      t.references :product_category, foreign_key: true
      t.references :tax, null: false, foreign_key: true

      t.timestamps
    end

    add_index :products, :name, unique: true
    add_index :products, :code, unique: true
  end
end
