class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :customer_nif
      t.string :customer_name
      t.references :sale, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :store_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
