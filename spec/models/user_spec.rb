# frozen_string_literal: true

require 'rails_helper'
describe User do
  describe '#create' do
    # name, email, password, password_confirmationが存在すれば登録可能
    it 'is valid with name, email, password, password_confirmation' do
      user = build(:user)
      expect(user).to be_valid
    end
    # nameが空では登録不可
    it 'is invalid without name' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end
    # emailが空では登録不可
    it 'is invalid without email' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end
    # passwordが空では登録不可
    it 'is invalid without password' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include('を入力してください')
    end
    # passwordが存在してもpassword_confirmationが空では登録不可
    it 'is invalid without password_confirmation although with a password' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include('とPasswordの入力が一致しません')
    end
    # nameが17文字以上では登録不可
    it 'is invalid with name that has more than 17 characters' do
      user = build(:user, name: 'abcdefghijklmnopq')
      user.valid?
      expect(user.errors[:name]).to include('は16文字以内で入力してください')
    end
    # nameが16文字以下では登録可能
    it 'is valid with name that has less than 16 characters' do
      user = build(:user, name: 'abcdefghijklmnop')
      expect(user).to be_valid
    end
    # 重複したemailは登録不可
    it 'is invalid with a duplicate email address' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('はすでに存在します')
    end
    # passwordが5文字以下では登録不可
    it 'is invalid with password that has less than 5 characters' do
      user = build(:user, password: '00000', password_confirmation: '00000')
      user.valid?
      expect(user.errors[:password]).to include('は6文字以上で入力してください')
    end
    # passwordが6文字以上では登録可能
    it 'is valid with password that has more than 6 characters' do
      user = build(:user, password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user).to be_valid
    end
    # avatarが空でも登録可能
    it 'is valid without avatar' do
      user = build(:user, avatar: nil)
      expect(user).to be_valid
    end
  end
end
