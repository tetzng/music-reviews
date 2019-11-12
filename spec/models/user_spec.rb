require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a name" do
      user = User.new(name: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end
    it "is invalid without a email" do
      user = User.new(name: "username", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
  end
end