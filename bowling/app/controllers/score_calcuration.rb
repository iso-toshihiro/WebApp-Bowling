# -*- coding: utf-8 -*-
class Get_down_pin_number

  def initialize(down_pins)
    @down_pin_list = []
    down_pins.each.with_index do |pins, i|  #整数値に変換
      @down_pin_list[i] = pins.to_i
    end
  end
  
  def first_roll(frame)
    return @down_pin_list[2*frame-2]
  end

  def second_roll(frame)
    return @down_pin_list[2*frame-1]
  end
  
  def third_roll(frame) #10フレーム目の3投目
    return @down_pin_list[2*frame]
  end

end

class Score_calcuration

  attr_accessor :scores

  def initialize(down_pins)
    @scores = []
    @bonus_point = 0 #ストライクとスペアのボーナス得点
    @get = Get_down_pin_number.new (down_pins)
  end
  
  def strike? (frame)
    @get.first_roll(frame) == 10
  end

  def spare? (frame)
    @get.first_roll(frame) + @get.second_roll(frame) == 10
  end

  def calcurate_scores
    #1フレーム目から9フレーム目の計算
    for frame in 1..9
      calcurate_1_9frame_score(frame)
    end

    #10フレーム目の計算
    calcurate_10frame_score

  end

  def calcurate_1_9frame_score(frame)
    if strike?(frame) and strike?(frame+1) #次フレームもストライクの場合
      @bonus_point = @get.first_roll(frame+1) + @get.first_roll(frame+2)
      if frame == 9 #9フレーム目だけ特別
        @bonus_point = @get.first_roll(10) + @get.second_roll(10)
      end
    elsif strike?(frame) #ストライクの場合
      @bonus_point = @get.first_roll(frame+1) + @get.second_roll(frame+1)
    elsif spare?(frame) #スペアの場合
      @bonus_point = @get.first_roll(frame+1)
    else
      @bonus_point = 0
    end

    if frame == 1
      @scores[0] = @get.first_roll(1) + @get.second_roll(1) + @bonus_point
    else
      @scores[frame-1] = @scores[frame-2] + @get.first_roll(frame) + @get.second_roll(frame) + @bonus_point
    end
  end
  
  def calcurate_10frame_score
    @scores[9] = @scores[8] + @get.first_roll(10) + @get.second_roll(10)
    if strike?(10) or spare?(10) #ストライクとスペアの場合のみ3投目も追加
      @scores[9] += @get.third_roll(10)
    end
  end
  

end
