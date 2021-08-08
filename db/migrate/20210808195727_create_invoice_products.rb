class CreateInvoiceProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :invoice_products do |t|
      t.references :invoice, null: false, foreign_key: true
      t.references :sale_product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
