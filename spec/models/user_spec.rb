require 'rails_helper'
describe User do
  describe '#create' do
    # name, email, password, password_confirmationが存在すれば登録可能
    it "is valid with name, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end
    # nameが空では登録不可
    it "is invalid without name" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    # emailが空では登録不可
    it "is invalid without email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    # passwordが空では登録不可
    it "is invalid without password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    # passwordが存在してもpassword_confirmationが空では登録不可
    it "is invalid without password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    # nameが17文字以上では登録不可
    it "is invalid with name that has more than 17 characters" do
      user = build(:user, name: "abcdefghijklmnopq")
      user.valid?
      expect(user.errors[:name]).to include("is too long (maximum is 16 characters)")
    end
    # nameが16文字以下では登録可能
    it "is valid with name that has less than 16 characters" do
      user = build(:user, name: "abcdefghijklmnop")
      expect(user).to be_valid
    end
    # 重複したemailは登録不可
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    # passwordが5文字以下では登録不可
    it "is invalid with password that has less than 5 characters" do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
    # passwordが6文字以上では登録可能
    it "is valid with password that has more than 6 characters" do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user).to be_valid
    end
  end
end
