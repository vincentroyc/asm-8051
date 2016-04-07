require 'asm8051/binary'
require 'asm8051/hex'
require 'asm8051/hex16'
require 'asm8051/hex8'
require 'asm8051/memory'
require 'asm8051/ra_memory'

module Asm8051
  class Core
    @@rom = Memory.new
    @@xram = RAMemory.new

    @@carry = Binary.new(false)

    def self.rom
      @@rom
    end

    def self.xram
      @@xram
    end

    def self.carry
      @@carry
    end
  end
end
