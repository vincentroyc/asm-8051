require 'spec_helper'

describe Asm8051::Memory do
  describe :read do
    context 'with upcase string key/value' do
      before { Asm8051::Core.rom.load_hash('FF' => 'AA') }

      it { expect(Asm8051::Core.rom.read(Asm8051::Hex8.new('FF'))).to eq(Asm8051::Hex8.new('AA')) }
    end

    context 'with downcase string key/value' do
      before { Asm8051::Core.rom.load_hash('ff' => 'bb') }

      it { expect(Asm8051::Core.rom.read(Asm8051::Hex8.new('FF'))).to eq(Asm8051::Hex8.new('BB')) }
    end

    context 'with none string key value' do
      before { Asm8051::Core.rom.load_hash(3 => 16) }

      it { expect(Asm8051::Core.rom.read(Asm8051::Hex8.new('3'))).to eq(Asm8051::Hex8.new('10')) }
    end
  end
end
