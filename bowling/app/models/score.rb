class Score < ActiveRecord::Base
  # attr_accessible :title, :body

  attr_accessible :player_name, :game_date,
             :down_pins_1st_roll_1_frame,
             :down_pins_2nd_roll_1_frame,
             :down_pins_1st_roll_2_frame, 
             :down_pins_2nd_roll_2_frame, 
             :down_pins_1st_roll_3_frame, 
             :down_pins_2nd_roll_3_frame, 
             :down_pins_1st_roll_4_frame, 
             :down_pins_2nd_roll_4_frame, 
             :down_pins_1st_roll_5_frame, 
             :down_pins_2nd_roll_5_frame, 
             :down_pins_1st_roll_6_frame,  
             :down_pins_2nd_roll_6_frame, 
             :down_pins_1st_roll_7_frame, 
             :down_pins_2nd_roll_7_frame, 
             :down_pins_1st_roll_8_frame, 
             :down_pins_2nd_roll_8_frame, 
             :down_pins_1st_roll_9_frame, 
             :down_pins_2nd_roll_9_frame, 
             :down_pins_1st_roll_10_frame, 
             :down_pins_2nd_roll_10_frame, 
             :down_pins_3rd_roll_10_frame, 
             :score_1_frame, 
             :score_2_frame, 
             :score_3_frame, 
             :score_4_frame, 
             :score_5_frame, 
             :score_6_frame, 
             :score_7_frame, 
             :score_8_frame, 
             :score_9_frame, 
             :score_10_frame

  def isoiso(ff)
    dd = ff
    list = []
    list[0] = dd.down_pins_1st_roll_1_frame
    list[1] = dd.down_pins_2nd_roll_1_frame
    return list
  end


  def get_down_pin_list(db_record)
    pin_list = []
    scores = db_record
    pin_list[0] = scores.down_pins_1st_roll_1_frame
    pin_list[1] = scores.down_pins_2nd_roll_1_frame
    pin_list[2] = scores.down_pins_1st_roll_2_frame
    pin_list[3] = scores.down_pins_2nd_roll_2_frame
    pin_list[4] = scores.down_pins_1st_roll_3_frame
    pin_list[5] = scores.down_pins_2nd_roll_3_frame
    pin_list[6] = scores.down_pins_1st_roll_4_frame
    pin_list[7] = scores.down_pins_2nd_roll_4_frame
    pin_list[8] = scores.down_pins_1st_roll_5_frame
    pin_list[9] = scores.down_pins_2nd_roll_5_frame
    pin_list[10] = scores.down_pins_1st_roll_6_frame
    pin_list[11] = scores.down_pins_2nd_roll_6_frame
    pin_list[12] = scores.down_pins_1st_roll_7_frame
    pin_list[13] = scores.down_pins_2nd_roll_7_frame
    pin_list[14] = scores.down_pins_1st_roll_8_frame
    pin_list[15] = scores.down_pins_2nd_roll_8_frame
    pin_list[16] = scores.down_pins_1st_roll_9_frame
    pin_list[17] = scores.down_pins_2nd_roll_9_frame
    pin_list[18] = scores.down_pins_1st_roll_10_frame
    pin_list[19] = scores.down_pins_2nd_roll_10_frame
    pin_list[20] = scores.down_pins_3rd_roll_10_frame
    return pin_list
  end

  def get_score_list(id)
    score_list = []
    scores = self.find(id)
    score_list[0] = scores.score_1_frame
    score_list[1] = scores.score_2_frame
    score_list[2] = scores.score_3_frame
    score_list[3] = scores.score_4_frame
    score_list[4] = scores.score_5_frame
    score_list[5] = scores.score_6_frame
    score_list[6] = scores.score_7_frame
    score_list[7] = scores.score_8_frame
    score_list[8] = scores.score_9_frame
    score_list[9] = scores.score_10_frame
    return score_list
  end
end
