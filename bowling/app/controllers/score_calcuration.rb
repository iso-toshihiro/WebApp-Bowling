# -*- coding: utf-8 -*-
class Score_calcuration

  attr_accessor :scores

  def initialize(down_pins)
    @scores = []
    @down_pin_list = []
    @bonus_point = 0 #ストライクとスペアのボーナス得点
    i = 0
    down_pins.each do |pins|  #整数値に変換
      @down_pin_list[i] = pins.to_i
      i += 1  
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
  
  def strike? (frame)
    first_roll(frame) == 10
  end

  def spare? (frame)
    first_roll(frame) + second_roll(frame) == 10
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
      @bonus_point = first_roll(frame+1) + first_roll(frame+2)
      if frame == 9 #9フレーム目だけ特別
        @bonus_point = first_roll(10) + second_roll(10)
      end
    elsif strike?(frame) #ストライクの場合
      @bonus_point = first_roll(frame+1) + second_roll(frame+1)
    elsif spare?(frame) #スペアの場合
      @bonus_point = first_roll(frame+1)
    else
      @bonus_point = 0
    end

    if frame == 1
      @scores[0] = first_roll(1) + second_roll(1) + @bonus_point
    else
      @scores[frame-1] = @scores[frame-2] + first_roll(frame) + second_roll(frame) + @bonus_point
    end
  end
  
  def calcurate_10frame_score
    if strike?(10) or spare?(10) 
      @scores[9] = @scores[8] + first_roll(10) + second_roll(10) + third_roll(10)
    else
      @scores[9] = @scores[8] + first_roll(10) + second_roll(10)
    end
  end
  

end
