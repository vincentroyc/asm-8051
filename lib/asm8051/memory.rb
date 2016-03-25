module Asm8051
  class Memory
    def initialize
      @hash = {}
    end

    def load_hash(hash)
      hash.each do |key, value|
        new_key = Asm8051::Hex.convert(key)
        new_value = Asm8051::Hex.convert(value)

        if !new_value.nil? && !new_key.nil?
          @hash[new_key.upcase.to_sym] = new_value
        end
      end
    end

    def read(hex_location)
      memory_value = @hash[hex_location.value.to_s(16).upcase.to_sym] || '00'
      Hex8.new(memory_value)
    end
  end
end
