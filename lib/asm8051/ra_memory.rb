module Asm8051
  class RAMemory < Memory
    def write(hex_location, hex_value)
      hash[hex_location.value.to_s(16)] = hex_value.value.to_s(16)
    end
  end
end
