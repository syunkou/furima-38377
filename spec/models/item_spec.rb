require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品ができないとき' do
      it 'ユーザー登録している人でないと出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist', "User can't be blank")
      end
      it '１枚画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
      end
      it '商品の状態の情報が「---」だと出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end
      it '商品の状態の情報が空欄だと出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
      end
      it '配送料の負担の情報が「---」だと出品できない' do
        @item.delivery_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 0")
      end
      it '配送料の負担の情報が空欄だと出品できない' do
        @item.delivery_charge_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank", "Delivery charge is not a number")
      end
      it '発送元の地域の情報が「---」だと出品できない' do
        @item.sender_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender must be other than 0")
      end
      it '発送元の地域の情報が空欄だと出品できない' do
        @item.sender_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank", "Sender is not a number")
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @item.shippedd_date_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippedd date must be other than 0")
      end
      it '発送までの日数の情報が空欄だと出品できない' do
        @item.shippedd_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippedd date can't be blank", "Shippedd date is not a number")
      end
      it '価格が空欄だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end