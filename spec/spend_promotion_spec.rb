require_relative 'spec_helper'

describe SpendPromotion do

  subject(:spend_promotion) {described_class.new}
  let(:sp_orders_value) {30}
  let(:sp_value_valid) {3.0}
  let(:sp_invalid_value) {0}
  let(:sp_invalid) {0}



  describe '#promotion value' do
    context 'will caluculate the value of the promotion available' do
      it 'returns the promotion value if it meets the valid requirements' do
        expect(spend_promotion.value(sp_orders_value)).to eq(sp_value_valid)
      end

      it 'returns 0 if the order does not meet the valid requirements' do
        expect(spend_promotion.value(sp_invalid_value)).to eq(sp_invalid)
      end
    end
  end

end
