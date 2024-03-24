require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
  end
  describe '購入情報の保存' do
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できない' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include ("Post code can't be blank")
        expect(@order_destination.errors.full_messages).to include ("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形でないと保存できない' do
        @order_destination.post_code = '1234567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include ("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include ("Prefecture can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include ("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include ("Address can't be blank")
      end
      it 'phone_numが空だと保存できない' do
        @order_destination.phone_num = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include ("Phone num can't be blank")
        expect(@order_destination.errors.full_messages).to include ("Phone num is invalid. Exclude hyphone(-)")
      end
      it 'phone_numは半角10桁以上11桁以内でないと保存できない' do
        @order_destination.phone_num = '123-4567-8900'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include ("Phone num is invalid. Exclude hyphone(-)")
      end
      it 'userが紐付いていないと保存できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include ("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include ("Item can't be blank")
      end
    end
  end
end
