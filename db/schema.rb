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

ActiveRecord::Schema[8.1].define(version: 2026_01_13_134911) do
  create_table "clients", force: :cascade do |t|
    t.text "address"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "name"
    t.integer "phone"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.decimal "discount", precision: 10, scale: 2, default: "0.0"
    t.date "due_date"
    t.decimal "grand_total"
    t.decimal "grandtotal", precision: 10, scale: 2, default: "0.0"
    t.string "invoice_number"
    t.date "issue_date"
    t.string "status"
    t.decimal "subtotal", precision: 10, scale: 2, default: "0.0"
    t.decimal "tax", precision: 10, scale: 2, default: "0.0"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["client_id"], name: "index_invoices_on_client_id"
    t.index ["invoice_number"], name: "index_invoices_on_invoice_number", unique: true
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.decimal "discount"
    t.integer "invoice_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity"
    t.decimal "tax"
    t.decimal "total_amount"
    t.decimal "unit_price"
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_line_items_on_invoice_id"
    t.index ["product_id"], name: "index_line_items_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.decimal "unit_price"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clients", "users"
  add_foreign_key "invoices", "clients"
  add_foreign_key "invoices", "users"
  add_foreign_key "line_items", "invoices"
  add_foreign_key "line_items", "products"
  add_foreign_key "products", "users"
end
