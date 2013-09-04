# -*- coding: utf-8 -*-
# coding : utf-8
require 'score_calculation'
require 'validation'

class ScoresController < ApplicationController

  def index
    @scores = Score.all
  end

  def show
    @score_db_record = Score.find(params[:id])
    @player_name = @score_db_record.player_name
    @game_date = @score_db_record.game_date.localtime
    score_object = Score.new
    @down_pins = score_object.get_down_pin_list(@score_db_record)
    @score_list = score_object.get_score_list(@score_db_record)
    @id = params[:id]
  end

  def new
    if params[:from] == 'create'
      @player_name = params[:player_name]
      @errors_pins_not_number = params[:errors_pins_not_number]
      @errors_pins_over_10 = params[:errors_pins_over_10]
      @error_3rd_roll_10frame = params[:error_3rd_roll_10frame]
      @error_10frame_2nd_3rd_roll = params[:error_10frame_2nd_3rd_roll]
      @error = 1
      @down_pins = params[:down_pins]
      @game_date = params[:game_date]
    else
      @player_name = 'ユーザー'
      @down_pins = Array.new(21,0)
      @game_date = '2013-08-25 12:00:00'
    end
    @from = 'new'
  end

  def edit
    @score_db_record = Score.find(params[:id])
    @player_name = @score_db_record.player_name
    @game_date = @score_db_record.game_date.localtime
    score_object = Score.new
    @down_pins = score_object.get_down_pin_list(@score_db_record)
    @score_list = score_object.get_score_list(@score_db_record)
    @from = 'edit'
    @id = params[:id]
  end

  def confirm
    @from = params[:from]
    @player_name = params[:new_player_name]
    if params[:current_time] == 'on'
      @game_date = Time.now
    else
      @game_date = params[:new_game_date]
    end
    @down_pins = params[:new_down_pins]

    validation = Validation.new(@down_pins)
    if validation.count_errors > 0
      redirect_to action: 'new', 
      from: 'create', 
      game_date: @game_date, 
      down_pins: @down_pins, 
      player_name: @player_name, 
      errors_pins_not_number: validation.errors_pins_not_number, 
      errors_pins_over_10: validation.errors_pins_over_10, 
      error_3rd_roll_10frame: validation.error_3rd_roll_10frame,
      error_10frame_2nd_3rd_roll: validation.error_10frame_2nd_3rd_roll
    end

    scores = ScoreCalculator.new (@down_pins)
    @score_list = scores.calculate_score_list
    if @from == 'edit'
      @id = params[:id]
      @old_player_name = params[:old_player_name]
      @old_game_date = params[:old_game_date]
      @old_down_pins = params[:old_down_pins]
      @old_score_list = params[:old_score_list]
    end
  end

  def create
    @player_name = params[:player_name]
    @game_date = params[:game_date]
    @down_pins = params[:down_pins]
    @score_list = params[:score_list]


    Score.create( :player_name => @player_name,
                  :game_date => @game_date,
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
                  :score_1_frame => @score_list[0], 
                  :score_2_frame => @score_list[1], 
                  :score_3_frame => @score_list[2], 
                  :score_4_frame => @score_list[3], 
                  :score_5_frame => @score_list[4], 
                  :score_6_frame => @score_list[5], 
                  :score_7_frame => @score_list[6], 
                  :score_8_frame => @score_list[7], 
                  :score_9_frame => @score_list[8], 
                  :score_10_frame => @score_list[9] )
  end

  def update
    @player_name = params[:player_name]
    @game_date = params[:game_date]
    @down_pins = params[:down_pins]
    @score_list = params[:score_list]
    @score_db_record = Score.find(params[:id])
    @score_db_record.update_attributes( :player_name => @player_name,
                  :game_date => @game_date,
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
                  :score_1_frame => @score_list[0], 
                  :score_2_frame => @score_list[1], 
                  :score_3_frame => @score_list[2], 
                  :score_4_frame => @score_list[3], 
                  :score_5_frame => @score_list[4], 
                  :score_6_frame => @score_list[5], 
                  :score_7_frame => @score_list[6], 
                  :score_8_frame => @score_list[7], 
                  :score_9_frame => @score_list[8], 
                  :score_10_frame => @score_list[9] )
 
  end

  def destroy
    @score_db_record = Score.find(params[:id])
    @score_db_record.destroy
    #Score.delete(params[:id])

  end
end
