require 'rails_helper'

describe RegistrationNumber do
  describe '.next' do
    subject { described_class.next }
    it 'returns an 8 character string' do
      expect(subject.length).to eq 8
    end

    it 'upcases the result' do
      expect(subject).to eq subject.upcase
    end

    context 'when a number is already used' do
      let(:used_number) { 'ABC12345' }
      let(:unused_number) { SecureRandom.uuid[0..7].upcase }
      before do
        allow(SecureRandom).to receive(:uuid).and_return(used_number, unused_number)
        Voter.create! registration_number: used_number
      end

      it 'recalcs a new number' do
        expect(subject).to eq unused_number
      end
    end
  end
end
