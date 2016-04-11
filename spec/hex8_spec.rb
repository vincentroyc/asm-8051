require 'spec_helper'

describe Asm8051::Hex8 do
  describe :initialize do
    context 'with none string input value' do
      it { expect { Asm8051::Hex8.new(12) }.to raise_exception(Asm8051::Hex8InvalidInputValueException) }
    end

    context 'with too long value' do
      it { expect { Asm8051::Hex8.new('B1F') }.to raise_exception(Asm8051::Hex8OverflowException) }
    end

    context 'with correct value' do
      let(:hex8) { Asm8051::Hex8.new('E6') }

      it { expect(hex8.value).to eq('e6'.hex) }
    end
  end

  describe :push do
    let(:hex8) { Asm8051::Hex8.new('7E') }

    before { hex8.push }
    it { expect(hex8.value).to eq(0) }
  end

  describe :pop do
    let(:hex8) { Asm8051::Hex8.new('4a') }

    before do
      hex8.push
      hex8.pop
    end
    it { expect(hex8.value).to eq('4A'.hex) }
  end

  describe :movc do
    let(:dptr) { Asm8051::Hex16.new('FF00') }
    let(:acc) { Asm8051::Hex8.new('2') }

    before do
      Asm8051::Core.rom.load_hash('FF02' => 'aa')
      acc.movc(dptr)
    end

    it { expect(acc.value).to eq(Asm8051::Hex8.new('AA').value) }
  end

  describe :inc do
    let(:hex8) { Asm8051::Hex8.new('FF') }

    before { hex8.inc }

    it { expect(hex8.value).to eq(Asm8051::Hex8.new('0').value) }
  end

  describe :rlc do
    let(:hex8) { Asm8051::Hex8.new('1') }

    before { hex8.rlc(carry) }

    context 'with set carry' do
      let(:carry) { Asm8051::Binary.new(true) }

      it { expect(hex8.to_bits).to eq('00000011') }
    end

    context 'with cleared carry' do
      let(:carry) { Asm8051::Binary.new(false) }

      it { expect(hex8.to_bits).to eq('00000010') }
    end
  end

  describe :add do
    let(:hex8) { Asm8051::Hex8.new('F0') }

    before do
      Asm8051::Core.carry.clr
      hex8.add(added_hex8)
    end

    context 'without overflow' do
      let(:added_hex8) { Asm8051::Hex8.new('F') }

      it { expect(hex8.value).to eq(Asm8051::Hex8.new('FF').value) }
      it { expect(Asm8051::Core.carry.value).to eq(0) }
    end

    context 'with overflow' do
      let(:added_hex8) { Asm8051::Hex8.new('10') }

      it { expect(hex8.value).to eq(Asm8051::Hex8.new('0').value) }
      it { expect(Asm8051::Core.carry.value).to eq(1) }
    end
  end

  describe :addc do
    let(:hex8) { Asm8051::Hex8.new('F0') }

    before do
      Asm8051::Core.carry.set
      hex8.addc(added_hex8)
    end

    context 'without overflow' do
      let(:added_hex8) { Asm8051::Hex8.new('E') }

      it { expect(hex8.value).to eq(Asm8051::Hex8.new('FF').value) }
      it { expect(Asm8051::Core.carry.value).to eq(0) }
    end

    context 'with overflow' do
      let(:added_hex8) { Asm8051::Hex8.new('F') }

      it { expect(hex8.value).to eq(Asm8051::Hex8.new('0').value) }
      it { expect(Asm8051::Core.carry.value).to eq(1) }
    end
  end

  describe :clr do
    let(:hex8) { Asm8051::Hex8.new('5E') }

    before { hex8.clr }

    it { expect(hex8.value).to eq(Asm8051::Hex8.new('0').value) }
  end
end
