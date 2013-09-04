# -*- coding: utf-8 -*-
class Validation

  attr_accessor :errors_pins_not_number
  attr_accessor :errors_pins_over_10
  attr_accessor :error_3rd_roll_10frame
  attr_accessor :error_10frame_2nd_3rd_roll
  attr_accessor :error_list

  def initialize(down_pins)
    @down_pins                   = down_pins
    @errors_pins_not_number      = [nil]
    @errors_pins_over_10         = [nil]
    @error_list                  = []
    @error_3rd_roll_10frame      = 0
    @error_10frame_2nd_3rd_roll  = 0
    @pin = DownPinNumber.new(@down_pins)

  end
  
  def count_errors
    error_count = 0

    error_count += validate_pin_is_number_low_10.size - 1

    error_count += validate_pin_number_sum_is_low_10_each_frame.size - 1

    error_count += validate_3rd_roll_10frame_is_0_unless_strike_or_spare

    error_count += validate_2nd_3rd_roll_sum_10frame_is_low_10

    return error_count
  end

  def get_error_list
    error_list = []
    error_list[0] = validate_pin_is_number_low_10
    error_list[1] = validate_pin_number_sum_is_low_10_each_frame
    error_list[2] = validate_3rd_roll_10frame_is_0_unless_strike_or_spare
    error_list[3] = validate_2nd_3rd_roll_sum_10frame_is_low_10
    return error_list
  end

  #倒したピン数の入力値は半角数字で０～１０でないといけない
  def validate_pin_is_number_low_10
    @down_pins.each.with_index do |pins, i|
      unless /^\d$/ =~ pins || pins == '10'
        @errors_pins_not_number << i
      end
    end
    return @errors_pins_not_number
  end

  #各フレームの1投目と2投目のピン数の和は10以下でないといけない（10フレーム目は例外がある）
  def validate_pin_number_sum_is_low_10_each_frame
    1.upto(10) do |frame|
      if @pin.get_first_roll(frame) + @pin.get_second_roll(frame) > 10
        unless frame == 10 && @pin.strike?(10)
          @errors_pins_over_10 << frame
        end
      end
    end
    return @errors_pins_over_10
  end

  #10フレーム目の3投目はストライクかスペアでないと入力できない
  def validate_3rd_roll_10frame_is_0_unless_strike_or_spare
    if @pin.get_third_roll(10) > 0
      unless @pin.strike?(10) || @pin.spare?(10)
        @error_3rd_roll_10frame = 1
      end
    end
    return @error_3rd_roll_10frame
  end

  #10フレーム目がストライクの時は2投目と3投目の和は10以下でないといけない（2投目がストライクの時は例外）
  def validate_2nd_3rd_roll_sum_10frame_is_low_10
    if @pin.strike?(10) && @pin.get_second_roll(10) != 10
      if @pin.get_second_roll(10) + @pin.get_third_roll(10) > 10
          @error_10frame_2nd_3rd_roll = 1
      end
    end
    return @error_10frame_2nd_3rd_roll
  end
        
end
