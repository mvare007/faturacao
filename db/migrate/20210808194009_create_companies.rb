class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :nif
      t.string :address
      t.string :zip_code
      t.string :location
      t.string :license_number
      t.string :activity_type
      t.string :status

      t.timestamps
    end
  end
end
