require 'spec_helper'

describe Asm8051::Hex8 do
  describe :initialize do
    context 'with none string input value' do
      it { expect { described_class.new(12) }.to raise_exception }
    end

    context 'with too long value' do
      it { expect { Asm8051::Hex8.new('B1F') }.to raise_exception }
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
end
