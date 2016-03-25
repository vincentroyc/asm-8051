module Asm8051
  class Hex8
    MAX = 'FF'.hex.freeze

    attr_accessor :value

    def initialize(value)
      raise Hex8OverflowException, '8 bit hex overflow' if !value.is_a?(String) || value.length > 2
      @value = value.hex
    end

    def rlc(carry)
      new_value = (to_bits << carry.value.to_s)
      new_value[0].to_i == 1 ? carry.set : carry.unset
      @value = new_value[1..8].to_i(2)
    end

    def add(hex)
      @value += hex.value
      @value = @value - MAX - 1 if @value > MAX
    end

    def addc(hex, carry)
      add hex
      @value += carry.value
      @value = @value - MAX - 1 if @value > MAX
    end

    def clr
      @value = '00'.hex
    end

    def mov(hex8)
      @value = hex8.value
    end

    def swap
      @value = (to_bits[4..7] << to_bits[0..3]).to_i(2)
    end

    def xch(hex8)
      new_value = hex8.value
      hex8.value = value
      @value = new_value
    end

    def anl(hex8)
      @value = (value & hex8.value)
    end

    def mul(hex8)
      new_value = @value * hex8.value
      new_value = new_value.to_s(2).rjust(16, '0')

      @value = new_value[8..15].to_i(2)
      hex8.value = new_value[0..7].to_i(2)
    end

    def to_bits
      @value.to_s(2).rjust(8, '0')
    end
  end

  class Hex8OverflowException < Exception
  end
end
