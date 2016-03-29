module Asm8051
  class Binary
    def initialize(set)
      raise BinaryInvalidInputValueException, "Invalid Binary input value : #{set}" unless set.is_a?(TrueClass) || set.is_a?(FalseClass)
      @set = set
    end

    def value
      @set ? 1 : 0
    end

    def to_bits
      value.to_s
    end

    def set
      @set = true
    end

    def clr
      @set = false
    end
  end

  class BinaryInvalidInputValueException < Exception
  end
end
