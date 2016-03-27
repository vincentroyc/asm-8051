require 'spec_helper'

describe Asm8051::Hex8 do
  describe :initialize do
    context 'with none string input value' do
      it { expect { Asm8051::Hex8.new(12) }.to raise_exception }
    end

    context 'with too long value' do
      it { expect { Asm8051::Hex8.new('B1F') }.to raise_exception }
    end

    context 'with correct value' do
      let(:hex8) { Asm8051::Hex8.new('E6') }

      it { expect(hex8.value).to eq('e6'.hex) }
    end
  end
end
