class CreateCompanyUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :company_users do |t|
      t.string :status
      t.boolean :company_admin
      t.boolean :company_supervisor
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
