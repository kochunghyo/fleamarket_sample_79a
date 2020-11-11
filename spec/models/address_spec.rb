require 'rails_helper'

describe Address do
  describe '#create' do

    it "全ての必須項目が入力されている場合は登録できること" do
      address = build(:address)
      expect(address).to be_valid
    end

    it "post_codeが入力されていない場合は登録できないこと" do
      address = build(:address, post_code: nil)
      address.valid?
      expect(address.errors[:post_code]).to include("を入力してください")
    end

    it "cityが入力されていない場合は登録できないこと" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "house_numberが入力されていない場合は登録できないこと" do
      address = build(:address, house_number: nil)
      address.valid?
      expect(address.errors[:house_number]).to include("を入力してください")
    end

    it "user_idがない場合は登録できないこと" do
      address = build(:address, user_id: nil)
      address.valid?
      expect(address.errors[:user_id]).to include()
    end

    it "prefecture_idがない場合は登録できないこと" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include()
    end

  end

end