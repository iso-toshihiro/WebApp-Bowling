# -*- coding: utf-8 -*-
class Validation

  attr_accessor :errors_pins_not_numbers
  
  def initialize(down_pins)
    @down_pins = []
    @down_pins = down_pins
    @errors_pins_not_numbers = []
  end
  
  def validate_down_pins
    @errors_pins_not_numbers = []
    @down_pins.each.with_index do |pins, i|
      unless /^\d$/ =~ pins || pins == '10'
        @errors_pins_not_numbers << i 
      end
    end
    return @errors_pins_not_numbers.size
  end

  def error?(g)
    return g
  end

end
