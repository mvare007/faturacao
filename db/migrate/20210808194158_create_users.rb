class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :status
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end
end
