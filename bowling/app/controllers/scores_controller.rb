require 'score_calcuration'

class ScoresController < ApplicationController

  def index
    @scores = Score.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def confirm
    @name = params[:player_name]
    if params[:current_time] == "on"
      @date = Time.now
    else
      @date = params[:game_date]
    end
    @down_pins = params[:down_pin]
    get_scores = Score_calcuration.new (@down_pins)
    get_scores.calcurate_scores
    @total = get_scores.scores
  end

  def create
    @name = params[:player_name]
    @date = params[:game_date]
    @down_pins = params[:down_pin]
    @total = params[:total]
    Score.create( :player_name => @name,
                  :game_date => @date,
                  :down_pins_1st_roll_1_frame => @down_pins[0],
                  :down_pins_2nd_roll_1_frame => @down_pins[1],
                  :down_pins_1st_roll_2_frame => @down_pins[2],
                  :down_pins_2nd_roll_2_frame => @down_pins[3], 
                  :down_pins_1st_roll_3_frame => @down_pins[4], 
                  :down_pins_2nd_roll_3_frame => @down_pins[5], 
                  :down_pins_1st_roll_4_frame => @down_pins[6], 
                  :down_pins_2nd_roll_4_frame => @down_pins[7], 
                  :down_pins_1st_roll_5_frame => @down_pins[8], 
                  :down_pins_2nd_roll_5_frame => @down_pins[9], 
                  :down_pins_1st_roll_6_frame => @down_pins[10],  
                  :down_pins_2nd_roll_6_frame => @down_pins[11], 
                  :down_pins_1st_roll_7_frame => @down_pins[12], 
                  :down_pins_2nd_roll_7_frame => @down_pins[13], 
                  :down_pins_1st_roll_8_frame => @down_pins[14], 
                  :down_pins_2nd_roll_8_frame => @down_pins[15], 
                  :down_pins_1st_roll_9_frame => @down_pins[16],
                  :down_pins_2nd_roll_9_frame => @down_pins[17], 
                  :down_pins_1st_roll_10_frame => @down_pins[18], 
                  :down_pins_2nd_roll_10_frame => @down_pins[19], 
                  :down_pins_3rd_roll_10_frame => @down_pins[20], 
                  :score_1_frame => @total[0], 
                  :score_2_frame => @total[1], 
                  :score_3_frame => @total[2], 
                  :score_4_frame => @total[3], 
                  :score_5_frame => @total[4], 
                  :score_6_frame => @total[5], 
                  :score_7_frame => @total[6], 
                  :score_8_frame => @total[7], 
                  :score_9_frame => @total[8], 
                  :score_10_frame => @total[9] )
  end

  def update
  end

  def destroy
  end
end
