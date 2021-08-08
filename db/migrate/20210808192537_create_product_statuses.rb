class CreateProductStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :product_statuses do |t|
      t.string :name
      t.string :key

      t.timestamps
    end
  end
end
