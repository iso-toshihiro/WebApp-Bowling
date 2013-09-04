# -*- coding: utf-8 -*-
class Validation

  attr_accessor :errors_pins_not_number
  attr_accessor :errors_pins_over_10
  attr_accessor :error_3rd_roll_10frame
  attr_accessor :errors_10frame_2nd_3rd_roll

  def initialize(down_pins)
    @down_pins                   = []
    @down_pins                   = down_pins
    @errors_pins_not_number      = []
    @errors_pins_over_10         = []
    @error_3rd_roll_10frame      = 0
    @errors_10frame_2nd_3rd_roll = 0
  end
  
  def validate_down_pins
    @errors_pins_not_number = [nil]
    @errors_pins_over_10 = [nil]
    @error_3rd_roll_10frame = 0
    @errors_10frame_2nd_3rd_roll = 0

    validate_pin_is_number

    validate_pin_low_10

    validate_3rd_roll_10frame

    validate_10frame_2nd_3rd_roll

    return @errors_pins_not_number.size + @errors_pins_over_10.size + @error_3rd_roll_10frame + @errors_10frame_2nd_3rd_roll
  end

  def error?(g)
    return g
  end

  def validate_pin_is_number
    @down_pins.each.with_index do |pins, i|
      unless /^\d$/ =~ pins || pins == '10'
        @errors_pins_not_number << i
      end
    end
  end

  def validate_pin_low_10
    1.upto(10) do |frame|
      if  @down_pins[2*frame-2].to_i + @down_pins[2*frame-1].to_i > 10
        unless frame == 10 && @down_pins[2*frame-2].to_i == 10
          @errors_pins_over_10 << frame
        end
      end
    end
  end

  def validate_3rd_roll_10frame
    if @down_pins[20].to_i > 0
      unless @down_pins[18].to_i == 10 || @down_pins[18].to_i + @down_pins[19].to_i == 10
        @error_3rd_roll_10frame = 1
      end
    end
  end

  def validate_10frame_2nd_3rd_roll
    if @down_pins[18].to_i == 10 && @down_pins[19].to_i != 10
      if  @down_pins[19].to_i + @down_pins[20].to_i > 10
          @errors_10frame_2nd_3rd_roll = 1
      end
    end
  end
        


end
