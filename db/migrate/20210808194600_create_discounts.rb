class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :description
      t.decimal :percentage
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end

    add_index :discounts, :name, unique: true
  end
end
