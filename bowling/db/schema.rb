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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130822042313) do

  create_table "scores", :force => true do |t|
    t.string   "player_name"
    t.time     "game_date"
    t.integer  "down_pins_1st_roll_1_frame"
    t.integer  "down_pins_2nd_roll_1_frame"
    t.integer  "down_pins_1st_roll_2_frame"
    t.integer  "down_pins_2nd_roll_2_frame"
    t.integer  "down_pins_1st_roll_3_frame"
    t.integer  "down_pins_2nd_roll_3_frame"
    t.integer  "down_pins_1st_roll_4_frame"
    t.integer  "down_pins_2nd_roll_4_frame"
    t.integer  "down_pins_1st_roll_5_frame"
    t.integer  "down_pins_2nd_roll_5_frame"
    t.integer  "down_pins_1st_roll_6_frame"
    t.integer  "down_pins_2nd_roll_6_frame"
    t.integer  "down_pins_1st_roll_7_frame"
    t.integer  "down_pins_2nd_roll_7_frame"
    t.integer  "down_pins_1st_roll_8_frame"
    t.integer  "down_pins_2nd_roll_8_frame"
    t.integer  "down_pins_1st_roll_9_frame"
    t.integer  "down_pins_2nd_roll_9_frame"
    t.integer  "down_pins_1st_roll_10_frame"
    t.integer  "down_pins_2nd_roll_10_frame"
    t.integer  "down_pins_3rd_roll_10_frame"
    t.integer  "score_1_frame"
    t.integer  "score_2_frame"
    t.integer  "score_3_frame"
    t.integer  "score_4_frame"
    t.integer  "score_5_frame"
    t.integer  "score_6_frame"
    t.integer  "score_7_frame"
    t.integer  "score_8_frame"
    t.integer  "score_9_frame"
    t.integer  "score_10_frame"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
