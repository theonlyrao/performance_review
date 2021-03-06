# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160418034216) do

  create_table "employees", force: :cascade do |t|
    t.string  "username"
    t.string  "password_digest"
    t.integer "team_id"
  end

  add_index "employees", ["team_id"], name: "index_employees_on_team_id"

  create_table "managers", force: :cascade do |t|
    t.string  "username"
    t.string  "password_digest"
    t.integer "organization_id"
  end

  add_index "managers", ["organization_id"], name: "index_managers_on_organization_id"

  create_table "organizations", force: :cascade do |t|
    t.string "name"
  end

  create_table "reviews", force: :cascade do |t|
    t.date    "date_given"
    t.integer "my_money"
    t.integer "my_team"
    t.boolean "at_risk"
    t.boolean "promote"
    t.integer "employee_id"
    t.integer "reviewer"
  end

  add_index "reviews", ["employee_id"], name: "index_reviews_on_employee_id"

  create_table "teams", force: :cascade do |t|
    t.string  "name"
    t.integer "manager_id"
  end

  add_index "teams", ["manager_id"], name: "index_teams_on_manager_id"

end
