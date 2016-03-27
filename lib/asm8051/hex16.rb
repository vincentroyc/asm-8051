module Asm8051
  class Hex16 < Hex
    attr_accessor :high_byte, :low_byte, :value

    def initialize(value)
      raise Hex16InvalidInputValueException, "16 bit hex invalid input value : #{value}" unless value.is_a?(String)
      raise Hex16OverflowException, "16 bit hex overflow : #{value}" if value.length > 4
      raise Hex16OverflowException, "16 bit hex overflow : #{value.hex}" if value.hex > 65_535

      low_byte_value = value[-2..-1]
      @low_byte = Hex8.new(low_byte_value)

      high_byte_value = value[-value.length..-3]
      @high_byte = Hex8.new(high_byte_value)
    end

    def push
      @low_byte.push
      @high_byte.push
    end

    def pop
      @low_byte.pop
      @high_byte.pop
    end

    def value
      (@high_byte.value.to_s(16) << @low_byte.value.to_s(16)).hex
    end
  end

  class Hex16InvalidInputValueException < Exception
  end
  class Hex16OverflowException < Exception
  end
end
