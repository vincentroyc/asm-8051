require 'spec_helper'

describe Asm8051::Hex16 do
  describe :initialize do
    context 'with none string input value' do
      it { expect { Asm8051::Hex16.new(12) }.to raise_exception }
    end

    context 'with too long value' do
      it { expect { Asm8051::Hex16.new('FF11F') }.to raise_exception }
    end

    context 'with correct value' do
      let(:hex16) { Asm8051::Hex16.new('E56') }

      it { expect(hex16.low_byte_value.value).to eq(Asm8051::Hex8.new('56').value) }
      it { expect(hex16.high_byte_value.value).to eq(Asm8051::Hex8.new('E').value) }
    end
  end
end
