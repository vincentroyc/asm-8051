module Asm8051
  class Hex
    def self.convert(value)
      new_value = value.hex unless value.is_a? Fixnum
      new_value ||= value
      new_value = new_value.to_i.to_s(16) unless new_value.nil?
      new_value ||= nil
      new_value
    end
  end
end
