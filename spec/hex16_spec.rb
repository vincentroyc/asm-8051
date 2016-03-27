require 'spec_helper'

describe Asm8051::Hex16 do
  describe :initialize do
    context 'with none string input value' do
      it { expect { Asm8051::Hex16.new(12) }.to raise_exception(Asm8051::Hex16InvalidInputValueException) }
    end

    context 'with too long value' do
      it { expect { Asm8051::Hex16.new('FF11F') }.to raise_exception(Asm8051::Hex16OverflowException) }
    end

    context 'with correct value' do
      let(:hex16) { Asm8051::Hex16.new('E56') }

      it { expect(hex16.low_byte.value).to eq(Asm8051::Hex8.new('56').value) }
      it { expect(hex16.high_byte.value).to eq(Asm8051::Hex8.new('E').value) }
    end
  end

  describe :push do
    let(:hex16) { Asm8051::Hex16.new('FFE') }

    before { hex16.push }
    it { expect(hex16.value).to eq(0) }
  end

  describe :pop do
    let(:hex16) { Asm8051::Hex16.new('FFE') }

    before do
      hex16.push
      hex16.pop
    end
    it { expect(hex16.value).to eq('FFE'.hex) }
  end
end
