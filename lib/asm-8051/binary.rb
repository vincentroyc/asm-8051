module Asm8051
  class Binary
    def initialize set
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

    def unset
      @set = false
    end
  end
end