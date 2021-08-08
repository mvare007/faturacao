class CreateStoreUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :store_users do |t|
      t.string :status
      t.boolean :store_admin
      t.boolean :store_supervisor
      t.references :user, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
