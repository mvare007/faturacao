class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.decimal :total
      t.decimal :total_tax
      t.references :store, null: false, foreign_key: true
      t.references :store_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
