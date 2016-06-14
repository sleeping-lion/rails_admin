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

ActiveRecord::Schema.define(version: 20131224223355) do

  create_table "ad_comments", force: :cascade do |t|
    t.integer  "ad_id",      limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "content",    limit: 200
    t.integer  "vote",       limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ad_comments", ["ad_id"], name: "index_ad_comments_on_ad_id", using: :btree
  add_index "ad_comments", ["user_id"], name: "index_ad_comments_on_user_id", using: :btree

  create_table "ad_daily_stats", force: :cascade do |t|
    t.integer  "ad_log_type_id", limit: 4
    t.integer  "ad_id",          limit: 4
    t.date     "date"
    t.integer  "hour",           limit: 4
    t.integer  "log_count",      limit: 4
    t.integer  "point_sum",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_file_types", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_files", force: :cascade do |t|
    t.integer  "ad_id",           limit: 4,                  null: false
    t.integer  "ad_file_type_id", limit: 4,                  null: false
    t.string   "filetype",        limit: 255,                null: false
    t.string   "fileext",         limit: 255,                null: false
    t.integer  "filesize",        limit: 4,   default: 0,    null: false
    t.string   "checksum",        limit: 255,                null: false
    t.string   "photo",           limit: 255
    t.boolean  "flag",                        default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ad_files", ["ad_id"], name: "index_ad_files_on_ad_id", using: :btree
  add_index "ad_files", ["filetype"], name: "index_ad_files_on_filetype", using: :btree

  create_table "ad_log_types", force: :cascade do |t|
    t.string   "title",      limit: 60, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_logs", force: :cascade do |t|
    t.integer  "ad_id",          limit: 4,             null: false
    t.integer  "user_id",        limit: 4,             null: false
    t.integer  "ad_log_type_id", limit: 4,             null: false
    t.integer  "point",          limit: 4, default: 0, null: false
    t.datetime "created_at"
    t.integer  "clientpoint",    limit: 4
    t.integer  "clienttime",     limit: 4
  end

  add_index "ad_logs", ["ad_id", "ad_log_type_id"], name: "index_ad_logs_on_ad_id_and_ad_log_type_id", using: :btree
  add_index "ad_logs", ["created_at"], name: "index_ad_logs_on_created_at", using: :btree

  create_table "ad_memos", force: :cascade do |t|
    t.text "content", limit: 65535, null: false
  end

  create_table "ad_options", force: :cascade do |t|
    t.integer  "ad_id",            limit: 4,                     null: false
    t.boolean  "event_flag",                     default: false, null: false
    t.boolean  "cpi_flag",                       default: false, null: false
    t.string   "cpi_type",         limit: 20
    t.string   "cpi_market",       limit: 20
    t.string   "cpi_pkg",          limit: 200
    t.string   "cpi_comment",      limit: 200
    t.boolean  "web_flag",                       default: false, null: false
    t.string   "web_addr",         limit: 200
    t.string   "web_comment",      limit: 200
    t.boolean  "callback_flag",                  default: false, null: false
    t.string   "callback_number",  limit: 50
    t.string   "callback_comment", limit: 200
    t.boolean  "video_flag",                     default: false, null: false
    t.string   "cpi_publisher",    limit: 100,   default: "",    null: false
    t.string   "cpi_apk_size",     limit: 100,   default: "",    null: false
    t.string   "cpi_version",      limit: 100,   default: "",    null: false
    t.text     "html_data",        limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "button_position",  limit: 4
    t.string   "track_id1",        limit: 255
    t.string   "track_id2",        limit: 255
  end

  add_index "ad_options", ["ad_id"], name: "index_ad_options_on_ad_id", using: :btree

  create_table "ad_schedules", force: :cascade do |t|
    t.integer  "ad_id",         limit: 4,                  null: false
    t.string   "title",         limit: 60
    t.datetime "start_time",                               null: false
    t.datetime "end_time",                                 null: false
    t.datetime "expire_time",                              null: false
    t.integer  "start_hour",    limit: 4
    t.integer  "end_hour",      limit: 4
    t.boolean  "weekday0",                                 null: false
    t.boolean  "weekday1",                                 null: false
    t.boolean  "weekday2",                                 null: false
    t.boolean  "weekday3",                                 null: false
    t.boolean  "weekday4",                                 null: false
    t.boolean  "weekday5",                                 null: false
    t.boolean  "weekday6",                                 null: false
    t.boolean  "flag",                     default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "cpi_only_flag",            default: false, null: false
    t.boolean  "hour_flag",                default: false, null: false
  end

  add_index "ad_schedules", ["ad_id"], name: "index_ad_schedules_on_ad_id", using: :btree

  create_table "ad_states", force: :cascade do |t|
    t.integer "ad_id",            limit: 4,             null: false
    t.integer "expose_target",    limit: 4, default: 0, null: false
    t.integer "expose_daylimit",  limit: 4, default: 0, null: false
    t.integer "expose_budget",    limit: 4, default: 0, null: false
    t.integer "expose_cost",      limit: 4, default: 0, null: false
    t.integer "expose_reward",    limit: 4, default: 0, null: false
    t.integer "expose_total",     limit: 4, default: 0, null: false
    t.integer "expose_today",     limit: 4, default: 0, null: false
    t.integer "view_target",      limit: 4, default: 0, null: false
    t.integer "view_daylimit",    limit: 4, default: 0, null: false
    t.integer "view_budget",      limit: 4, default: 0, null: false
    t.integer "view_cost",        limit: 4, default: 0, null: false
    t.integer "view_reward",      limit: 4, default: 0, null: false
    t.integer "view_total",       limit: 4, default: 0, null: false
    t.integer "view_today",       limit: 4, default: 0, null: false
    t.integer "install_target",   limit: 4, default: 0, null: false
    t.integer "install_daylimit", limit: 4, default: 0, null: false
    t.integer "install_budget",   limit: 4, default: 0, null: false
    t.integer "install_cost",     limit: 4, default: 0, null: false
    t.integer "install_reward",   limit: 4, default: 0, null: false
    t.integer "install_total",    limit: 4, default: 0, null: false
    t.integer "install_today",    limit: 4, default: 0, null: false
    t.integer "extra_target",     limit: 4, default: 0, null: false
    t.integer "extra_daylimit",   limit: 4, default: 0, null: false
    t.integer "extra_budget",     limit: 4, default: 0, null: false
    t.integer "extra_cost",       limit: 4, default: 0, null: false
    t.integer "extra_reward",     limit: 4, default: 0, null: false
    t.integer "extra_total",      limit: 4, default: 0, null: false
    t.integer "extra_today",      limit: 4, default: 0, null: false
  end

  add_index "ad_states", ["ad_id"], name: "ad_id", using: :btree

  create_table "ad_target_addresses", force: :cascade do |t|
    t.integer  "ad_schedule_id", limit: 4,                null: false
    t.integer  "address_id",     limit: 4,                null: false
    t.boolean  "flag",                     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ad_target_addresses", ["ad_schedule_id", "address_id"], name: "index_ad_target_addresses_on_ad_schedule_id_and_address_id", unique: true, using: :btree
  add_index "ad_target_addresses", ["ad_schedule_id"], name: "index_ad_target_addresses_on_ad_schedule_id", using: :btree
  add_index "ad_target_addresses", ["address_id"], name: "index_ad_target_addresses_on_address_id", using: :btree

  create_table "ad_target_cids", force: :cascade do |t|
    t.integer  "ad_schedule_id", limit: 4,                 null: false
    t.string   "cid",            limit: 20,                null: false
    t.boolean  "flag",                      default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ad_target_cids", ["ad_schedule_id", "cid"], name: "index_ad_target_cids_on_ad_schedule_id_and_cid", unique: true, using: :btree

  create_table "ad_targets", force: :cascade do |t|
    t.integer  "ad_schedule_id", limit: 4,                null: false
    t.integer  "target_id",      limit: 4,                null: false
    t.boolean  "flag",                     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ad_targets", ["ad_schedule_id", "target_id"], name: "index_ad_targets_on_ad_schedule_id_and_target_id", unique: true, using: :btree
  add_index "ad_targets", ["ad_schedule_id"], name: "index_ad_targets_on_ad_schedule_id", using: :btree
  add_index "ad_targets", ["target_id"], name: "index_ad_targets_on_target_id", using: :btree

  create_table "ad_types", force: :cascade do |t|
    t.string   "title",          limit: 60,                null: false
    t.string   "file_prefix",    limit: 60
    t.integer  "max_file_count", limit: 4,  default: 1
    t.boolean  "flag",                      default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_users", force: :cascade do |t|
    t.integer  "ad_id",          limit: 4
    t.integer  "user_id",        limit: 4
    t.integer  "ad_log_type_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ad_users", ["ad_id"], name: "index_ad_users_on_ad_id", using: :btree
  add_index "ad_users", ["user_id"], name: "index_ad_users_on_user_id", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.integer  "parent_address_id", limit: 4,   default: 0,    null: false
    t.integer  "level",             limit: 4,   default: 0,    null: false
    t.string   "name",              limit: 60,                 null: false
    t.string   "zipcode",           limit: 10
    t.float    "latitude",          limit: 24,  default: 0.0
    t.float    "longitude",         limit: 24,  default: 0.0
    t.string   "full_address",      limit: 255,                null: false
    t.boolean  "flag",                          default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["name"], name: "index_addresses_on_name", using: :btree
  add_index "addresses", ["parent_address_id"], name: "index_addresses_on_parent_address_id", using: :btree

  create_table "admin_action_logs", force: :cascade do |t|
    t.integer  "admin_id",   limit: 4
    t.string   "action",     limit: 100, null: false
    t.string   "user_ip",    limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_action_logs", ["admin_id"], name: "index_admin_action_logs_on_admin_id", using: :btree

  create_table "admins", force: :cascade do |t|
    t.integer  "parent_id",          limit: 4
    t.integer  "address_id",         limit: 4
    t.string   "login_id",           limit: 60,                 null: false
    t.string   "email",              limit: 255
    t.string   "nickname",           limit: 255
    t.string   "encrypted_password", limit: 255,                null: false
    t.string   "photo",              limit: 255
    t.string   "company",            limit: 60
    t.string   "tel1",               limit: 60
    t.string   "tel2",               limit: 60
    t.string   "address1",           limit: 200
    t.string   "address2",           limit: 200
    t.boolean  "flag",                           default: true, null: false
    t.integer  "sign_in_count",      limit: 4,   default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip", limit: 255
    t.string   "last_sign_in_ip",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["login_id"], name: "index_admins_on_login_id", unique: true, using: :btree
  add_index "admins", ["nickname"], name: "index_admins_on_nickname", unique: true, using: :btree

  create_table "ads", force: :cascade do |t|
    t.integer  "admin_id",            limit: 4,                   null: false
    t.integer  "sponsor_id",          limit: 4,                   null: false
    t.integer  "agent_id",            limit: 4,                   null: false
    t.integer  "ad_type_id",          limit: 4,                   null: false
    t.string   "title",               limit: 60,                  null: false
    t.string   "description",         limit: 200
    t.string   "display_type",        limit: 10,  default: "0"
    t.boolean  "priority",                        default: false, null: false
    t.integer  "ad_schedules_count",  limit: 4,   default: 0,     null: false
    t.integer  "ad_files_count",      limit: 4,   default: 0,     null: false
    t.integer  "ad_file_image_count", limit: 4,   default: 0,     null: false
    t.boolean  "flag",                            default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ads", ["ad_type_id"], name: "index_ads_on_ad_type_id", using: :btree
  add_index "ads", ["admin_id"], name: "index_ads_on_admin_id", using: :btree
  add_index "ads", ["agent_id"], name: "index_ads_on_agent_id", using: :btree
  add_index "ads", ["sponsor_id"], name: "index_ads_on_sponsor_id", using: :btree

  create_table "app_log_types", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.boolean  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "app_logs", force: :cascade do |t|
    t.integer  "app_log_type_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.integer  "log_value",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "app_logs", ["app_log_type_id"], name: "index_app_logs_on_app_log_type_id", using: :btree
  add_index "app_logs", ["user_id"], name: "index_app_logs_on_user_id", using: :btree

  create_table "app_markets", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.integer  "count",      limit: 4,  default: 0,    null: false
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "app_versions", force: :cascade do |t|
    t.string   "client_version", limit: 60,                 null: false
    t.string   "version_name",   limit: 60,                 null: false
    t.string   "state",          limit: 1,                  null: false
    t.string   "contents",       limit: 255,                null: false
    t.string   "apk_file",       limit: 255
    t.datetime "update_date",                               null: false
    t.boolean  "flag",                       default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendance_event_prizes", force: :cascade do |t|
    t.integer  "attendance_event_id", limit: 4,   null: false
    t.string   "title",               limit: 60,  null: false
    t.integer  "count",               limit: 4
    t.string   "photo",               limit: 255
    t.boolean  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendance_events", force: :cascade do |t|
    t.string   "title",      limit: 60,  null: false
    t.string   "photo",      limit: 255
    t.boolean  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendance_pictures", force: :cascade do |t|
    t.integer  "attendance_setting_id", limit: 4
    t.string   "title",                 limit: 100,                null: false
    t.date     "start_date",                                       null: false
    t.string   "photo",                 limit: 255
    t.boolean  "flag",                              default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendance_pictures", ["attendance_setting_id"], name: "index_attendance_pictures_on_attendance_setting_id", using: :btree

  create_table "attendances", force: :cascade do |t|
    t.integer  "attendance_event_id", limit: 4, null: false
    t.integer  "user_id",             limit: 4, null: false
    t.date     "today"
    t.integer  "count",               limit: 4
    t.boolean  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attendances", ["attendance_event_id"], name: "index_attendances_on_attendance_event_id", using: :btree
  add_index "attendances", ["user_id"], name: "index_attendances_on_user_id", using: :btree

  create_table "banks", force: :cascade do |t|
    t.string   "name",       limit: 60,                null: false
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carriers", force: :cascade do |t|
    t.string   "code",       limit: 10
    t.string   "string",     limit: 40
    t.string   "name",       limit: 40
    t.boolean  "flag",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "coupon_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "amount",     limit: 4
    t.boolean  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "delete_users", force: :cascade do |t|
    t.string   "username",   limit: 60,                null: false
    t.string   "nickname",   limit: 60,                null: false
    t.string   "email",      limit: 60,                null: false
    t.string   "nation_num", limit: 10, default: "82", null: false
    t.string   "mobile_num", limit: 20,                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: :cascade do |t|
    t.string   "device_id",       limit: 100
    t.string   "registration_id", limit: 100
    t.integer  "user_id",         limit: 4
    t.boolean  "flag",                        default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faq_contents", force: :cascade do |t|
    t.boolean "html",                  default: false, null: false
    t.text    "content", limit: 65535,                 null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.integer  "view_count", limit: 4,  default: 0
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type", limit: 255
    t.integer  "impressionable_id",   limit: 4
    t.integer  "user_id",             limit: 4
    t.string   "controller_name",     limit: 255
    t.string   "action_name",         limit: 255
    t.string   "view_name",           limit: 255
    t.string   "request_hash",        limit: 255
    t.string   "ip_address",          limit: 255
    t.string   "session_hash",        limit: 255
    t.text     "message",             limit: 65535
    t.text     "referrer",            limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: {"impressionable_type"=>nil, "message"=>255, "impressionable_id"=>nil}, using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "internal_exchange_rates", force: :cascade do |t|
    t.float    "rate",       limit: 24, default: 0.0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mobile_prefixes", force: :cascade do |t|
    t.string   "locale",        limit: 255,             null: false
    t.string   "prefix",        limit: 255,             null: false
    t.integer  "prefix_length", limit: 4,   default: 3, null: false
    t.string   "telco",         limit: 255,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notice_contents", force: :cascade do |t|
    t.boolean "html",                  default: false, null: false
    t.text    "content", limit: 65535,                 null: false
  end

  create_table "notices", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.integer  "view_count", limit: 4,  default: 0
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "point_types", force: :cascade do |t|
    t.string   "title",         limit: 60,                null: false
    t.integer  "amount",        limit: 4,  default: 0,    null: false
    t.boolean  "flag",                     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "transact_type", limit: 4,  default: 0,    null: false
  end

  create_table "points", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,             null: false
    t.integer  "point_type_id", limit: 4,             null: false
    t.integer  "amount",        limit: 4, default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "points", ["point_type_id"], name: "point_type_id", using: :btree
  add_index "points", ["user_id", "point_type_id"], name: "index_points_on_user_id_and_point_type_id", using: :btree

  create_table "points_ads", force: :cascade do |t|
    t.integer "point_id", limit: 4, null: false
    t.integer "ad_id",    limit: 4, null: false
  end

  add_index "points_ads", ["ad_id"], name: "index_points_ads_on_ad_id", using: :btree
  add_index "points_ads", ["point_id", "ad_id"], name: "index_points_ads_on_point_id_and_ad_id", unique: true, using: :btree
  add_index "points_ads", ["point_id"], name: "index_points_ads_on_point_id", using: :btree

  create_table "quiz_addresses", force: :cascade do |t|
    t.integer  "quiz_logs_id", limit: 4,               null: false
    t.integer  "address_id",   limit: 4,               null: false
    t.string   "name",         limit: 60,              null: false
    t.string   "mobilephone",  limit: 60,              null: false
    t.string   "address",      limit: 255,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4,   default: 0, null: false
  end

  create_table "quiz_answers", force: :cascade do |t|
    t.integer  "quiz_questions_id", limit: 4
    t.string   "title",             limit: 255,                 null: false
    t.boolean  "is_correct",                    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_logs", force: :cascade do |t|
    t.integer  "quizzes_id",      limit: 4
    t.integer  "quiz_answers_id", limit: 4
    t.integer  "users_id",        limit: 4
    t.integer  "winner_flag",     limit: 4, default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.integer  "quizzes_id", limit: 4
    t.string   "title",      limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quiz_types", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.boolean  "flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer  "quiz_type_id", limit: 4,               null: false
    t.string   "title",        limit: 200
    t.string   "description",  limit: 255
    t.string   "photo",        limit: 255
    t.string   "sponsor",      limit: 255
    t.string   "sponsor_url",  limit: 255
    t.integer  "price",        limit: 4
    t.integer  "budget",       limit: 4
    t.integer  "balance",      limit: 4,   default: 0
    t.integer  "point",        limit: 4,   default: 1
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "winner_count", limit: 4,   default: 1
  end

  create_table "quizzes_user_address_books", force: :cascade do |t|
    t.integer "quiz_id",              limit: 4, null: false
    t.integer "user_address_book_id", limit: 4, null: false
  end

  add_index "quizzes_user_address_books", ["quiz_id"], name: "index_quizzes_user_address_books_on_quiz_id", using: :btree
  add_index "quizzes_user_address_books", ["user_address_book_id"], name: "index_quizzes_user_address_books_on_user_address_book_id", using: :btree

  create_table "rapns_apps", force: :cascade do |t|
    t.string   "name",        limit: 255,               null: false
    t.string   "environment", limit: 255
    t.text     "certificate", limit: 65535
    t.string   "password",    limit: 255
    t.integer  "connections", limit: 4,     default: 1, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",        limit: 255,               null: false
    t.string   "auth_key",    limit: 255
  end

  create_table "rapns_feedback", force: :cascade do |t|
    t.string   "device_token", limit: 64,  null: false
    t.datetime "failed_at",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "app",          limit: 255
  end

  add_index "rapns_feedback", ["device_token"], name: "index_rapns_feedback_on_device_token", using: :btree

  create_table "rapns_notifications", force: :cascade do |t|
    t.integer  "badge",             limit: 4
    t.string   "device_token",      limit: 64
    t.string   "sound",             limit: 255,      default: "default"
    t.string   "alert",             limit: 255
    t.text     "data",              limit: 65535
    t.integer  "expiry",            limit: 4,        default: 86400
    t.boolean  "delivered",                          default: false,     null: false
    t.datetime "delivered_at"
    t.boolean  "failed",                             default: false,     null: false
    t.datetime "failed_at"
    t.integer  "error_code",        limit: 4
    t.text     "error_description", limit: 65535
    t.datetime "deliver_after"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "alert_is_json",                      default: false
    t.string   "type",              limit: 255,                          null: false
    t.string   "collapse_key",      limit: 255
    t.boolean  "delay_while_idle",                   default: false,     null: false
    t.text     "registration_ids",  limit: 16777215
    t.integer  "app_id",            limit: 4,                            null: false
    t.integer  "retries",           limit: 4,        default: 0
  end

  add_index "rapns_notifications", ["app_id", "delivered", "failed", "deliver_after"], name: "index_rapns_notifications_multi", using: :btree

  create_table "request_settings", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.integer  "amount",     limit: 4,                 null: false
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_types", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "request_setting_id", limit: 4
    t.integer  "point_id",           limit: 4
    t.integer  "request_type_id",    limit: 4
    t.integer  "bank_id",            limit: 4
    t.integer  "amount",             limit: 4,   default: 0, null: false
    t.string   "account_number",     limit: 100,             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["bank_id"], name: "index_requests_on_bank_id", using: :btree
  add_index "requests", ["point_id"], name: "index_requests_on_point_id", using: :btree
  add_index "requests", ["request_setting_id"], name: "index_requests_on_request_setting_id", using: :btree
  add_index "requests", ["request_type_id"], name: "index_requests_on_request_type_id", using: :btree
  add_index "requests", ["user_id"], name: "index_requests_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_admins", force: :cascade do |t|
    t.integer "role_id",  limit: 4
    t.integer "admin_id", limit: 4
  end

  add_index "roles_admins", ["admin_id"], name: "index_roles_admins_on_admin_id", unique: true, using: :btree
  add_index "roles_admins", ["role_id", "admin_id"], name: "index_roles_admins_on_role_id_and_admin_id", unique: true, using: :btree
  add_index "roles_admins", ["role_id"], name: "index_roles_admins_on_role_id", using: :btree

  create_table "roulette_backgrounds", force: :cascade do |t|
    t.string   "title",      limit: 60
    t.string   "photo",      limit: 255,                 null: false
    t.boolean  "priority",               default: false, null: false
    t.boolean  "flag",                   default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roulette_plays", force: :cascade do |t|
    t.integer  "roulette_setting_id", limit: 4
    t.integer  "user_id",             limit: 4, null: false
    t.integer  "point_id",            limit: 4
    t.integer  "amount",              limit: 4, null: false
    t.integer  "client_ip",           limit: 4, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roulette_plays", ["point_id"], name: "index_roulette_plays_on_point_id", using: :btree
  add_index "roulette_plays", ["roulette_setting_id"], name: "index_roulette_plays_on_roulette_setting_id", using: :btree
  add_index "roulette_plays", ["user_id"], name: "index_roulette_plays_on_user_id", using: :btree

  create_table "roulette_plays_roulette_presents", force: :cascade do |t|
    t.integer "roulette_play_id",    limit: 4,               null: false
    t.integer "roulette_present_id", limit: 4,               null: false
    t.string  "receive_flag",        limit: 1, default: "1", null: false
  end

  add_index "roulette_plays_roulette_presents", ["roulette_play_id"], name: "index_roulette_plays_roulette_presents_on_roulette_play_id", using: :btree
  add_index "roulette_plays_roulette_presents", ["roulette_present_id"], name: "index_roulette_plays_roulette_presents_on_roulette_present_id", using: :btree

  create_table "roulette_plays_user_address_books", force: :cascade do |t|
    t.integer "roulette_play_id",     limit: 4, null: false
    t.integer "user_address_book_id", limit: 4, null: false
  end

  add_index "roulette_plays_user_address_books", ["roulette_play_id"], name: "index_roulette_plays_user_address_books_on_roulette_play_id", using: :btree
  add_index "roulette_plays_user_address_books", ["user_address_book_id"], name: "index_roulette_plays_user_address_books_on_user_address_book_id", using: :btree

  create_table "roulette_presents", force: :cascade do |t|
    t.string   "title",      limit: 60
    t.string   "photo",      limit: 255,                 null: false
    t.boolean  "priority",               default: false, null: false
    t.boolean  "flag",                   default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roulette_settings", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.float    "percentage", limit: 24, default: 0.0,  null: false
    t.integer  "amount",     limit: 4,                 null: false
    t.integer  "limit",      limit: 4,  default: 0,    null: false
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sms_messages", force: :cascade do |t|
    t.integer  "msg_status",    limit: 4,    default: 0, null: false
    t.string   "msg_phone",     limit: 30,               null: false
    t.string   "msg_callback",  limit: 30,               null: false
    t.string   "msg_charset",   limit: 10,               null: false
    t.string   "msg_text",      limit: 1000,             null: false
    t.datetime "msg_sendtime"
    t.datetime "msg_rslttime"
    t.datetime "msg_lasttime"
    t.integer  "msg_rsltcode",  limit: 4
    t.integer  "msg_priority",  limit: 4,    default: 0, null: false
    t.string   "msg_device_id", limit: 255
    t.integer  "user_id",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sms_messages", ["id"], name: "index_sms_messages_on_id", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ads_count",  limit: 4,  default: 0,    null: false
  end

  create_table "store_applications", force: :cascade do |t|
    t.integer  "store_good_id", limit: 4
    t.integer  "user_id",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "store_applications", ["store_good_id"], name: "index_store_applications_on_store_good_id", using: :btree
  add_index "store_applications", ["user_id"], name: "index_store_applications_on_user_id", using: :btree

  create_table "store_good_pictures", force: :cascade do |t|
    t.integer  "store_good_id", limit: 4
    t.string   "type",          limit: 40
    t.string   "title",         limit: 100
    t.string   "filename",      limit: 100
    t.string   "photo",         limit: 255
    t.boolean  "flag",                      default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "store_good_pictures", ["store_good_id"], name: "index_store_good_pictures_on_store_good_id", using: :btree

  create_table "store_goods", force: :cascade do |t|
    t.string   "title",                     limit: 100,                   null: false
    t.string   "description_short",         limit: 200,                   null: false
    t.text     "description",               limit: 65535,                 null: false
    t.integer  "stock_count",               limit: 4,     default: 0,     null: false
    t.integer  "order_count",               limit: 4,     default: 0,     null: false
    t.datetime "sale_start_time",                                         null: false
    t.datetime "sale_end_time",                                           null: false
    t.float    "sale_price",                limit: 24,                    null: false
    t.string   "sale_type",                 limit: 255
    t.boolean  "proirity_flag",                           default: false, null: false
    t.boolean  "hot_flag",                                default: false, null: false
    t.integer  "store_good_pictures_count", limit: 4,     default: 0,     null: false
    t.boolean  "flag",                                    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "new_flag",                                default: false, null: false
    t.integer  "store_type_id",             limit: 4,                     null: false
    t.integer  "store_applications_count",  limit: 4,     default: 0,     null: false
  end

  create_table "store_order_statuses", force: :cascade do |t|
    t.string   "title",      limit: 50
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "store_orders", force: :cascade do |t|
    t.integer  "store_good_id",         limit: 4
    t.integer  "user_id",               limit: 4
    t.float    "amount",                limit: 24
    t.string   "customer_tel",          limit: 40,                    null: false
    t.string   "delivery_tel",          limit: 40,                    null: false
    t.string   "delivery_zipcode",      limit: 40,                    null: false
    t.string   "delivery_address_1",    limit: 40,                    null: false
    t.string   "delivery_address_2",    limit: 40
    t.string   "delivery_note",         limit: 200
    t.string   "shipping_method",       limit: 255
    t.string   "shipping_track_number", limit: 255
    t.datetime "shipping_time"
    t.boolean  "shipping_flag",                       default: false
    t.string   "return_reason",         limit: 255
    t.datetime "return_time"
    t.boolean  "return_flag",                         default: false, null: false
    t.text     "note",                  limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "delivery_name",         limit: 60
    t.integer  "store_order_status_id", limit: 4,     default: 1,     null: false
  end

  add_index "store_orders", ["store_good_id"], name: "index_store_orders_on_store_good_id", using: :btree
  add_index "store_orders", ["user_id"], name: "index_store_orders_on_user_id", using: :btree

  create_table "store_types", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "target_types", force: :cascade do |t|
    t.string   "title",      limit: 60,                null: false
    t.boolean  "flag",                  default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "targets", force: :cascade do |t|
    t.integer  "target_type_id", limit: 4,                  null: false
    t.string   "title",          limit: 100,                null: false
    t.boolean  "flag",                       default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "targets", ["target_type_id"], name: "index_targets_on_target_type_id", using: :btree

  create_table "user_address_books", force: :cascade do |t|
    t.integer  "user_id",      limit: 4,               null: false
    t.integer  "address_id",   limit: 4,               null: false
    t.string   "name",         limit: 60,              null: false
    t.string   "mobilephone",  limit: 60,              null: false
    t.string   "address",      limit: 255,             null: false
    t.integer  "primary_flag", limit: 4,   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_address_books", ["address_id"], name: "index_user_address_books_on_address_id", using: :btree
  add_index "user_address_books", ["user_id"], name: "index_user_address_books_on_user_id", using: :btree

  create_table "user_login_logs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "device_id",  limit: 64
    t.integer  "client_ip",  limit: 4,                  null: false
    t.boolean  "flag",                  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_login_logs", ["user_id"], name: "index_user_login_logs_on_user_id", using: :btree

  create_table "user_point_counters", force: :cascade do |t|
    t.integer "deposit_start",          limit: 4, default: 0, null: false
    t.integer "deposit_call",           limit: 4, default: 0, null: false
    t.integer "deposit_recommend_user", limit: 4, default: 0, null: false
    t.integer "deposit_recommender",    limit: 4, default: 0, null: false
    t.integer "deposit_app_download",   limit: 4, default: 0, null: false
    t.integer "deposit_event",          limit: 4, default: 0, null: false
    t.integer "deposit_game",           limit: 4, default: 0, null: false
    t.integer "deposit_survey",         limit: 4, default: 0, null: false
    t.integer "use_money",              limit: 4, default: 0, null: false
    t.integer "use_game",               limit: 4, default: 0, null: false
    t.integer "use_shop",               limit: 4, default: 0, null: false
  end

  create_table "user_referrals", force: :cascade do |t|
    t.integer "user_id",           limit: 4, null: false
    t.integer "recommend_user_id", limit: 4, null: false
  end

  add_index "user_referrals", ["recommend_user_id"], name: "index_user_referrals_on_recommend_user_id", using: :btree
  add_index "user_referrals", ["user_id", "recommend_user_id"], name: "index_user_referrals_on_user_id_and_recommend_user_id", unique: true, using: :btree
  add_index "user_referrals", ["user_id"], name: "index_user_referrals_on_user_id", unique: true, using: :btree

  create_table "user_target_addresses", force: :cascade do |t|
    t.integer "user_id",    limit: 4, null: false
    t.integer "address_id", limit: 4, null: false
  end

  add_index "user_target_addresses", ["address_id"], name: "index_user_target_addresses_on_address_id", using: :btree
  add_index "user_target_addresses", ["user_id", "address_id"], name: "index_user_target_addresses_on_user_id_and_address_id", unique: true, using: :btree
  add_index "user_target_addresses", ["user_id"], name: "index_user_target_addresses_on_user_id", unique: true, using: :btree

  create_table "user_targets", force: :cascade do |t|
    t.integer "user_id",   limit: 4, null: false
    t.integer "target_id", limit: 4, null: false
  end

  add_index "user_targets", ["target_id"], name: "index_user_targets_on_target_id", using: :btree
  add_index "user_targets", ["user_id", "target_id"], name: "index_user_targets_on_user_id_and_target_id", unique: true, using: :btree
  add_index "user_targets", ["user_id"], name: "index_user_targets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",           limit: 40,                 null: false
    t.string   "nickname",           limit: 40
    t.string   "email",              limit: 100
    t.string   "encrypted_password", limit: 40,                 null: false
    t.string   "salt",               limit: 40,                 null: false
    t.string   "photo",              limit: 255
    t.string   "nation_num",         limit: 10,  default: "86", null: false
    t.string   "mobile_num",         limit: 20,                 null: false
    t.string   "service_provider",   limit: 20,                 null: false
    t.string   "device_id",          limit: 100,                null: false
    t.integer  "point",              limit: 4,   default: 0,    null: false
    t.integer  "coupon",             limit: 4,   default: 0,    null: false
    t.string   "client_version",     limit: 255
    t.datetime "last_seen_at"
    t.integer  "sign_in_count",      limit: 4,   default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip", limit: 255
    t.string   "last_sign_in_ip",    limit: 255
    t.boolean  "flag",                           default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "market",             limit: 100
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["nickname"], name: "index_users_on_nickname", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "ad_files", "ads", name: "ad_files_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ad_memos", "ads", column: "id", name: "ad_memos_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ad_options", "ads", name: "ad_options_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ad_schedules", "ads", name: "ad_schedules_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ad_states", "ads", name: "ad_states_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ad_target_addresses", "ad_schedules", name: "ad_target_addresses_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ad_target_addresses", "addresses", name: "ad_target_addresses_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ad_target_cids", "ad_schedules", name: "ad_target_cids_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ad_targets", "ad_schedules", name: "ad_targets_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ad_targets", "targets", name: "ad_targets_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ads", "ad_types", name: "ads_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ads", "admins", column: "agent_id", name: "ads_ibfk_4", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ads", "admins", name: "ads_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ads", "sponsors", name: "ads_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "faq_contents", "faqs", column: "id", name: "faq_contents_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "notice_contents", "notices", column: "id", name: "notice_contents_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "points", "point_types", name: "points_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "points", "users", name: "points_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "points_ads", "ads", name: "points_ads_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "points_ads", "points", name: "points_ads_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "requests", "banks", name: "requests_ibfk_5", on_update: :cascade, on_delete: :cascade
  add_foreign_key "requests", "points", name: "requests_ibfk_4", on_update: :cascade, on_delete: :nullify
  add_foreign_key "requests", "request_settings", name: "requests_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "requests", "request_types", name: "requests_ibfk_3", on_update: :cascade, on_delete: :cascade
  add_foreign_key "requests", "users", name: "requests_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "roles_admins", "admins", name: "roles_admins_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "roles_admins", "roles", name: "roles_admins_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "roulette_plays", "points", name: "roulette_plays_ibfk_3", on_update: :cascade, on_delete: :nullify
  add_foreign_key "roulette_plays", "roulette_settings", name: "roulette_plays_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "roulette_plays", "users", name: "roulette_plays_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "roulette_plays_roulette_presents", "roulette_plays", name: "roulette_plays_roulette_presents_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "roulette_plays_roulette_presents", "roulette_presents", name: "roulette_plays_roulette_presents_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "store_good_pictures", "store_goods", name: "store_good_pictures_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "store_orders", "store_goods", name: "store_orders_ibfk_1", on_update: :cascade, on_delete: :nullify
  add_foreign_key "store_orders", "users", name: "store_orders_ibfk_2", on_update: :cascade, on_delete: :nullify
  add_foreign_key "targets", "target_types", name: "targets_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_point_counters", "users", column: "id", name: "user_point_counters_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_referrals", "users", column: "recommend_user_id", name: "user_referrals_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_referrals", "users", name: "user_referrals_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_target_addresses", "addresses", name: "user_target_addresses_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_target_addresses", "users", name: "user_target_addresses_ibfk_1", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_targets", "targets", name: "user_targets_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_targets", "users", name: "user_targets_ibfk_1", on_update: :cascade, on_delete: :cascade
end
