require_relative 'spec_helper'

describe Promotion do

  order_hash_one = {:Standard => 3, :Express => 1}
  order_hash_two = {:Standard => 0, :Express => 3}
  # subject(:promotion) {described_class.new(order_hash_one)}
  let(:order_value_test) {50}
  let(:discount_value_one) {45.0}
  let(:discount_value_two) {40.5}


  describe '#value' do

    subject(:promotion) {described_class.new(order_hash_one)}

    context 'will caluculate the value of the order' do
      it 'receives two arguments from the order method' do
        promotion.order
        expect(promotion.order_value).to eq(order_value_test)
      end
    end
  end

  describe '#discount' do
    context 'will deduct any available promotions' do

      subject(:promotion) {described_class.new(order_hash_one)}

      before do
        promotion.order
      end

      it 'iterates through available promotions deducting values' do
        promotion.discount
        expect(promotion.order_value).to eq(discount_value_one)
      end
    end

    context 'will deduct any available promotions' do

      subject(:promotion) {described_class.new(order_hash_two)}

      before do
        promotion.order
      end

      it 'iterates through available promotions deducting values' do
        promotion.discount
        expect(promotion.order_value).to eq(discount_value_two)
      end
    end
  end

end
