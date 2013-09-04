# -*- coding: utf-8 -*-
class ScoreCalculator

  attr_accessor :score_list

  def initialize(down_pins)
    @score_list = []
    @bonus_point = 0 #ストライクとスペアのボーナス得点
    @pin = DownPinNumber.new (down_pins)
  end

  def calculate_score_list
    1.upto(9) do |frame|
      calculate_1_9frame_score(frame)
    end

    #10フレーム目の計算
    calculate_10frame_score

    return @score_list
  end

  def calculate_1_9frame_score(frame)
    if @pin.strike?(frame) && @pin.strike?(frame+1) #次フレームもストライクの場合
      @bonus_point = @pin.get_first_roll(frame+1) + @pin.get_first_roll(frame+2)
      if frame == 9 #9フレーム目だけ特別
        @bonus_point = @pin.get_first_roll(10) + @pin.get_second_roll(10)
      end
    elsif @pin.strike?(frame) #ストライクの場合
      @bonus_point = @pin.get_first_roll(frame+1) + @pin.get_second_roll(frame+1)
    elsif @pin.spare?(frame) #スペアの場合
      @bonus_point = @pin.get_first_roll(frame+1)
    else
      @bonus_point = 0
    end

    if frame == 1
      @score_list[0] = @pin.get_first_roll(1) + @pin.get_second_roll(1) + @bonus_point
    else
      @score_list[frame-1] = @score_list[frame-2] + @pin.get_first_roll(frame) + @pin.get_second_roll(frame) + @bonus_point
    end
  end
  
  def calculate_10frame_score
    @score_list[9] = @score_list[8] + @pin.get_first_roll(10) + @pin.get_second_roll(10)
    if @pin.strike?(10) || @pin.spare?(10) #ストライクとスペアの場合のみ3投目も追加
      @score_list[9] += @pin.get_third_roll(10)
    end
  end
  

end
