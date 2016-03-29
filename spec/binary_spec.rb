require 'spec_helper'

describe Asm8051::Binary do
  describe :initialize do
    context 'with wrong input value' do
      it { expect { Asm8051::Binary.new(0) }.to raise_error(Asm8051::BinaryInvalidInputValueException) }
    end

    context 'with proper input value' do
      context 'as true' do
        it { expect(Asm8051::Binary.new(false).to_bits).to eq('0') }
      end

      context 'as false' do
        it { expect(Asm8051::Binary.new(true).to_bits).to eq('1') }
      end
    end
  end

  describe :value do
    context 'when set' do
      it { expect(Asm8051::Binary.new(true).value).to eq(1) }
    end

    context 'when unset' do
      it { expect(Asm8051::Binary.new(false).value).to eq(0) }
    end
  end

  describe :set do
    let(:binary) { Asm8051::Binary.new(false) }

    before { binary.set }

    it { expect(binary.value).to eq(1) }
  end

  describe :clr do
    let(:binary) { Asm8051::Binary.new(true) }

    before { binary.clr }

    it { expect(binary.value).to eq(0) }
  end
end
