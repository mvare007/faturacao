class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :nif
      t.string :address
      t.string :zip_code
      t.string :location
      t.string :license_number
      t.string :status

      t.timestamps
    end
  end
end
