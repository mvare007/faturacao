class CreateProductCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :product_categories do |t|
      t.string :name
      t.string :key
      t.text :description

      t.timestamps
    end
  end
end
