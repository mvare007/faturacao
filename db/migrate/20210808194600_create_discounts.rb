class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :description
      t.decimal :percentage
      t.date :expiry_date

      t.timestamps
    end

    add_index :discounts, :name, unique: true
  end
end
