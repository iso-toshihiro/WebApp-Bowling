class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|

      t.string :player_name
      t.time :game_date

      t.integer :down_pins_1st_roll_1_frame
      t.integer :down_pins_2nd_roll_1_frame
      t.integer :down_pins_1st_roll_2_frame
      t.integer :down_pins_2nd_roll_2_frame
      t.integer :down_pins_1st_roll_3_frame
      t.integer :down_pins_2nd_roll_3_frame
      t.integer :down_pins_1st_roll_4_frame
      t.integer :down_pins_2nd_roll_4_frame
      t.integer :down_pins_1st_roll_5_frame
      t.integer :down_pins_2nd_roll_5_frame
      t.integer :down_pins_1st_roll_6_frame
      t.integer :down_pins_2nd_roll_6_frame
      t.integer :down_pins_1st_roll_7_frame
      t.integer :down_pins_2nd_roll_7_frame
      t.integer :down_pins_1st_roll_8_frame
      t.integer :down_pins_2nd_roll_8_frame
      t.integer :down_pins_1st_roll_9_frame
      t.integer :down_pins_2nd_roll_9_frame
      t.integer :down_pins_1st_roll_10_frame
      t.integer :down_pins_2nd_roll_10_frame
      t.integer :down_pins_3rd_roll_10_frame

      t.integer :score_1_frame
      t.integer :score_2_frame
      t.integer :score_3_frame
      t.integer :score_4_frame
      t.integer :score_5_frame
      t.integer :score_6_frame
      t.integer :score_7_frame
      t.integer :score_8_frame
      t.integer :score_9_frame
      t.integer :score_10_frame

      t.timestamps
    end
  end
end
