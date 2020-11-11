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

  describe '#update' do

    it "全ての必須項目が入力されている場合は登録できること" do
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      expect(product).to be_valid
    end

    it "nameがない場合は登録できないこと" do 
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.name = nil
      expect(product.errors[:name]).to include()
    end

    it "explanationがない場合は登録できないこと" do 
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.explanation = nil
      expect(product.errors[:explanation]).to include()
    end

    it "priceがない場合は登録できないこと" do 
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.price = nil
      expect(product.errors[:price]).to include()
    end

    it "status_idがない場合は登録できないこと" do 
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.status_id = nil
      expect(product.errors[:status_id]).to include()
    end

    it "category_idがない場合は登録できないこと" do 
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.category_id = nil
      expect(product.errors[:category_id]).to include()
    end

    it "shipping_day_idがない場合は登録できないこと" do 
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], delivery_fee_id: delivery_fee[:id])
      product.shipping_day_id = nil
      expect(product.errors[:shipping_day_id]).to include()
    end
    
    it "shipping_area_idがない場合は登録できないこと" do 
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id],shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.shipping_area_id = nil
      expect(product.errors[:shipping_area_id]).to include()
    end

    it "delivery_fee_idがない場合は登録できないこと" do 
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.delivery_fee_id = nil
      expect(product.errors[:delivery_fee_id]).to include()
    end

    it "imagesがない場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.images = []
      product.valid?
      expect(product.errors[:images]).to include()
    end

    it "nameが40文字以下の場合は登録できること" do 
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.name = "aaaaabbbbbcccccdddddeeeeefffffggggghhhhh"
      expect(product).to be_valid
    end

    it "nameが41文字以上の場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.name = "aaaaabbbbbcccccdddddeeeeefffffggggghhhhhi"
      expect(product.errors[:name]).to include()
    end

    it "explanationが1000文字以下の場合は登録できること" do
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.explanation = "aaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjj"
      expect(product).to be_valid
    end

    it "explanationが1001文字以上の場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.name = "aaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjaaaaabbbbbcccccdddddeeeeefffffggggghhhhhiiiiijjjjjk"
      expect(product.errors[:explanation]).to include()
    end

    it "priceが300の場合は登録できること" do
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.price = "300"
      expect(product).to be_valid
    end

    it "priceが299以下の場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.price = "299"
      expect(product.errors[:price]).to include()
    end

    it "priceが9999999以下の場合は登録できること" do
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.price = "9999999"
      expect(product).to be_valid
    end

    it "priceが10000000以上の場合は登録できないこと" do
      user = create(:user)
      category = create(:category)
      status = create(:status)
      shipping_area = create(:shipping_area)
      shipping_day = create(:shipping_day)
      delivery_fee = create(:delivery_fee)
      product = build(:product, seller_id: user[:id], category_id: category[:id], status_id: status[:id], shipping_area_id: shipping_area[:id], shipping_day_id: shipping_day[:id], delivery_fee_id: delivery_fee[:id])
      product.price = "10000000"
      expect(product.errors[:price]).to include()
    end

  end
end