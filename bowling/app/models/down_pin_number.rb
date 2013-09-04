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

  def strike?(frame)
    get_first_roll(frame) == 10
  end

  def spare?(frame)
    get_first_roll(frame) + get_second_roll(frame) == 10
  end

end
