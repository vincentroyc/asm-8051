module Asm8051
  class Hex16
    attr_accessor :high_byte_value, :low_byte_value

    def initialize(value)
      raise Hex16InvalidInputValueException, "16 bit hex invalid input value : #{value}" unless value.is_a?(String)
      raise Hex16OverflowException, "16 bit hex overflow : #{value}" if value.length > 4
      raise Hex16OverflowException, "16 bit hex overflow : #{value.hex}" if value.hex > 65_535

      low_byte = value[-2..-1]
      @low_byte_value = Hex8.new(low_byte)

      high_byte = value[-value.length..-3]
      @high_byte_value = Hex8.new(high_byte)
    end
  end

  class Hex16InvalidInputValueException < Exception
  end
  class Hex16OverflowException < Exception
  end
end
