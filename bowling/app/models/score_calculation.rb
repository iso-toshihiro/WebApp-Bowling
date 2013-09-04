# -*- coding: utf-8 -*-
class DownPinNumber

  def initialize(down_pins)
    @down_pin_list = []
    down_pins.each.with_index do |pins, i|  #整数値に変換
      @down_pin_list[i] = pins.to_i
    end
  end
  
  def get_first_roll(frame)
    return @down_pin_list[2*frame-2]
  end

  def get_second_roll(frame)
    return @down_pin_list[2*frame-1]
  end
  
  def get_third_roll(frame) #10フレーム目の3投目
    return @down_pin_list[2*frame]
  end

end

class ScoreCalculator

  attr_accessor :score_list

  def initialize(down_pins)
    @score_list = []
    @bonus_point = 0 #ストライクとスペアのボーナス得点
    @pin = DownPinNumber.new (down_pins)
  end
  
  def strike?(frame)
    @pin.get_first_roll(frame) == 10
  end

  def spare?(frame)
    @pin.get_first_roll(frame) + @pin.get_second_roll(frame) == 10
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
    if strike?(frame) && strike?(frame+1) #次フレームもストライクの場合
      @bonus_point = @pin.get_first_roll(frame+1) + @pin.get_first_roll(frame+2)
      if frame == 9 #9フレーム目だけ特別
        @bonus_point = @pin.get_first_roll(10) + @pin.get_second_roll(10)
      end
    elsif strike?(frame) #ストライクの場合
      @bonus_point = @pin.get_first_roll(frame+1) + @pin.get_second_roll(frame+1)
    elsif spare?(frame) #スペアの場合
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
    if strike?(10) || spare?(10) #ストライクとスペアの場合のみ3投目も追加
      @score_list[9] += @pin.get_third_roll(10)
    end
  end
  

end
