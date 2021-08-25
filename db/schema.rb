# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_10_145634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "nif"
    t.string "address"
    t.string "zip_code"
    t.string "location"
    t.string "license_number"
    t.string "activity_type"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "company_products", force: :cascade do |t|
    t.string "status"
    t.decimal "stock"
    t.decimal "target_stock"
    t.bigint "company_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_products_on_company_id"
    t.index ["product_id"], name: "index_company_products_on_product_id"
  end

  create_table "company_users", force: :cascade do |t|
    t.string "status"
    t.boolean "company_admin"
    t.boolean "company_supervisor"
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_users_on_company_id"
    t.index ["user_id"], name: "index_company_users_on_user_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "percentage"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_discounts_on_company_id"
    t.index ["name"], name: "index_discounts_on_name", unique: true
  end

  create_table "invoice_products", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.bigint "operation_product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_invoice_products_on_invoice_id"
    t.index ["operation_product_id"], name: "index_invoice_products_on_operation_product_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "customer_nif"
    t.string "customer_name"
    t.bigint "operation_id", null: false
    t.bigint "company_id", null: false
    t.bigint "company_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_invoices_on_company_id"
    t.index ["company_user_id"], name: "index_invoices_on_company_user_id"
    t.index ["operation_id"], name: "index_invoices_on_operation_id"
  end

  create_table "operation_products", force: :cascade do |t|
    t.bigint "operation_id", null: false
    t.bigint "product_id", null: false
    t.bigint "discount_id"
    t.decimal "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discount_id"], name: "index_operation_products_on_discount_id"
    t.index ["operation_id"], name: "index_operation_products_on_operation_id"
    t.index ["product_id"], name: "index_operation_products_on_product_id"
  end

  create_table "operations", force: :cascade do |t|
    t.decimal "total"
    t.decimal "total_tax"
    t.bigint "company_id", null: false
    t.bigint "company_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_operations_on_company_id"
    t.index ["company_user_id"], name: "index_operations_on_company_user_id"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_product_categories_on_name", unique: true
  end

  create_table "product_statuses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_product_statuses_on_name", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "unit_price"
    t.string "code"
    t.text "description"
    t.bigint "product_status_id", null: false
    t.bigint "product_category_id"
    t.bigint "tax_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_products_on_code", unique: true
    t.index ["name"], name: "index_products_on_name", unique: true
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["product_status_id"], name: "index_products_on_product_status_id"
    t.index ["tax_id"], name: "index_products_on_tax_id"
  end

  create_table "taxes", force: :cascade do |t|
    t.string "name"
    t.decimal "percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_taxes_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "status"
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "password_digest"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "company_products", "companies"
  add_foreign_key "company_products", "products"
  add_foreign_key "company_users", "companies"
  add_foreign_key "company_users", "users"
  add_foreign_key "discounts", "companies"
  add_foreign_key "invoice_products", "invoices"
  add_foreign_key "invoice_products", "operation_products"
  add_foreign_key "invoices", "companies"
  add_foreign_key "invoices", "company_users"
  add_foreign_key "invoices", "operations"
  add_foreign_key "operation_products", "discounts"
  add_foreign_key "operation_products", "operations"
  add_foreign_key "operation_products", "products"
  add_foreign_key "operations", "companies"
  add_foreign_key "operations", "company_users"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "product_statuses"
  add_foreign_key "products", "taxes"
end
