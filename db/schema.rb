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

ActiveRecord::Schema.define(version: 20140423135722) do

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0
    t.integer  "attempts",   default: 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "folder_entries", force: true do |t|
    t.integer "folder_id"
    t.integer "resource_id"
    t.string  "resource_type"
  end

  create_table "folders", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", force: true do |t|
    t.integer "policy_id"
    t.integer "subject_id"
    t.string  "subject_type"
    t.integer "mask"
  end

  create_table "policies", force: true do |t|
    t.string  "title"
    t.integer "public_mask"
  end

  create_table "taverna_player_interactions", force: true do |t|
    t.boolean  "replied",                     default: false
    t.integer  "run_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "displayed",                   default: false
    t.text     "page"
    t.string   "feed_reply"
    t.text     "data",       limit: 16777215
    t.string   "serial"
    t.string   "page_uri"
  end

  add_index "taverna_player_interactions", ["run_id", "replied"], name: "index_taverna_player_interactions_on_run_id_and_replied"
  add_index "taverna_player_interactions", ["run_id", "serial"], name: "index_taverna_player_interactions_on_run_id_and_serial"
  add_index "taverna_player_interactions", ["run_id"], name: "index_taverna_player_interactions_on_run_id"

  create_table "taverna_player_run_ports", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.string   "port_type"
    t.integer  "run_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "depth",             default: 0
    t.text     "metadata"
  end

  add_index "taverna_player_run_ports", ["run_id", "name"], name: "index_taverna_player_run_ports_on_run_id_and_name"
  add_index "taverna_player_run_ports", ["run_id"], name: "index_taverna_player_run_ports_on_run_id"

  create_table "taverna_player_runs", force: true do |t|
    t.string   "run_id"
    t.string   "saved_state",        default: "pending", null: false
    t.datetime "create_time"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.integer  "workflow_id",                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status_message_key"
    t.string   "results_file_name"
    t.integer  "results_file_size"
    t.boolean  "embedded",           default: false
    t.boolean  "stop",               default: false
    t.string   "log_file_name"
    t.integer  "log_file_size"
    t.string   "name",               default: "None"
    t.integer  "delayed_job_id"
    t.text     "failure_message"
    t.integer  "parent_id"
    t.integer  "user_id"
    t.integer  "policy_id"
  end

  add_index "taverna_player_runs", ["parent_id"], name: "index_taverna_player_runs_on_parent_id"
  add_index "taverna_player_runs", ["policy_id"], name: "index_taverna_player_runs_on_policy_id"
  add_index "taverna_player_runs", ["user_id"], name: "index_taverna_player_runs_on_user_id"
  add_index "taverna_player_runs", ["workflow_id"], name: "index_taverna_player_runs_on_workflow_id"

  create_table "taverna_player_service_credentials", force: true do |t|
    t.string   "uri",         null: false
    t.string   "name"
    t.text     "description"
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taverna_player_service_credentials", ["uri"], name: "index_taverna_player_service_credentials_on_uri"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "workflow_input_ports", force: true do |t|
    t.integer "workflow_id"
    t.string  "name"
    t.text    "description"
    t.text    "example_value"
  end

  create_table "workflow_output_ports", force: true do |t|
    t.integer "workflow_id"
    t.string  "name"
    t.text    "description"
    t.text    "example_value"
  end

  create_table "workflows", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "diagram_file_name"
    t.string   "diagram_content_type"
    t.integer  "diagram_file_size"
    t.datetime "diagram_updated_at"
    t.integer  "policy_id"
  end

  add_index "workflows", ["policy_id"], name: "index_workflows_on_policy_id"

end
