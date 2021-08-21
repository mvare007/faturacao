class CreateCompanyProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :company_products do |t|
      t.string :status
      t.decimal :stock
      t.decimal :target_stock
      t.references :company, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
