require_relative 'spec_helper'

describe ExpressPromotion do

  subject(:express_promotion) {described_class.new}
  let(:exp_orders_valid) {2}
  let(:exp_value_valid) {15}
  let(:exp_invalid) {0}



  describe '#promotion value' do
    context 'will caluculate the value of the promotion available' do
      it 'returns the promotion value if it meets the valid requirements' do
        expect(express_promotion.value(exp_orders_valid)).to eq(exp_value_valid)
      end

      it 'returns 0 if the order does not meet the valid requirements' do
        expect(express_promotion.value(exp_invalid)).to eq(exp_invalid)
      end
    end
  end

end
