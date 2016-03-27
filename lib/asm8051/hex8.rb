module Asm8051
  class Hex8 < Hex
    MAX = 'FF'.hex.freeze

    attr_accessor :value

    def initialize(value)
      raise Hex8InvalidInputValueException, "8 bit hex invalid input value : #{value}" unless value.is_a?(String)
      raise Hex8OverflowException, "8 bit hex overflow : #{value}" if value.length > 2
      raise Hex8OverflowException, "8 bit hex overflow : #{value.hex}" if value.hex > 255
      @stack = []
      @value = value.hex
    end

    def push
      @stack.push value
      @value = '0'.hex
    end

    def pop
      @value = @stack.pop
    end

    def movc(hex16)
      offset_hex_location = Hex16.new((hex16.value + @value).to_s(16))
      @value = Core.rom.read(offset_hex_location).value
    end

    def inc
      @value += 1
      @value = @value - MAX - 1 if @value > MAX
    end

    # Note : def below this comment are not tested!

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

    def ==(other)
      other.class == self.class && other.to_bits == to_bits
    end
  end

  class Hex8OverflowException < Exception
  end
  class Hex8InvalidInputValueException < Exception
  end
end
