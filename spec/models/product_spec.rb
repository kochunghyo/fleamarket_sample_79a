require 'rails_helper'

describe Product do
  describe '#create' do
      it "全ての項目が入力されている場合は出品できること" do
        category = create(:category)
        status = create(:status)
        shipping_area = create(:shipping_area)
        shipping_day = create(:shipping_day)
        delivery_fee = create(:delivery_fee)
        product = build(:product, category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
        expect(product).to be_valid
      end

      it "商品画像が無い場合は出品できないこと" do
        product = build(:product)
        product.images = []
        product.valid?
        expect(product.errors[:images]).to include("を入力してください")
      end
   end
end