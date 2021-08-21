class CreateOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :operations do |t|
      t.decimal :total
      t.decimal :total_tax
      t.references :company, null: false, foreign_key: true
      t.references :company_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
