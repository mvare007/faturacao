class CreateSaleProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :sale_products do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :discount, foreign_key: true
      t.decimal :quantity

      t.timestamps
    end
  end
end
