require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
 before do
    @order_delivery = FactoryBot.build(:order_delivery)
  end
  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'postcode、prefecture_id、city、block、buildingm、phone_numberが正しい値で存在すれば登録できる' do
        expect(@order_delivery).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_delivery.building = nil
        expect(@order_delivery).to be_valid
      end
    end
    context '配送先情報の保存ができないとき' do
      it 'postcodeが空では保存できない' do
        @order_delivery.postcode = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postcode can't be blank", "Postcode is invalid")
      end
      it 'postcodeが「3桁ハイフン4桁」の半角文字列以外は保存できない' do
        @order_delivery.postcode = '2222-444'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Postcode is invalid")
      end
      it 'prefecture_idが未選択では保存できない' do
        @order_delivery.prefecture_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @order_delivery.city = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では保存できない' do
        @order_delivery.block = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Block can't be blank")
      end
      it 'blockが空では保存できない' do
        @order_delivery.block = ""
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_delivery.phone_number = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberが10桁以上11桁以内の半角数値以外は保存できない' do
        @order_delivery.phone_number = "123-456-789"
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
