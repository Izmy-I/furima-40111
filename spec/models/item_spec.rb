require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品出品ができる時' do
      it 'image、item_name、description、category_id、condition_id、fee_pay_id、prefecture_id、deliver_day_id、priceが存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない時' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_nameが40文字以上では保存できない' do
        @item.item_name = Faker::Lorem.paragraph_by_chars(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name is too long (maximum is 40 characters)")
      end

      it 'descriptionが空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'descriptionが1000文字以上では保存できない' do
        @item.description = Faker::Lorem.paragraph_by_chars(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end

      it 'category_idが空（1）では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空（1）では保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'fee_pay_idが空（1）では保存できない' do
        @item.fee_pay_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee pay can't be blank")
      end
      it 'prefecture_idが空（1）では保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_day_idが空（1）では保存できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end

      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満では保存できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが9999999超えでは保存できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角数値以外では保存できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
