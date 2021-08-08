class CreateTaxes < ActiveRecord::Migration[6.1]
  def change
    create_table :taxes do |t|
      t.string :name
      t.decimal :percentage

      t.timestamps
    end

    add_index :taxes, :name, unique: true
  end
end
