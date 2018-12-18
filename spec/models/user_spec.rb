require 'rails_helper'
describe User do
  describe '#create' do
    # ニックネームがなければ登録できない
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # メアドがなければ登録できない
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

  end

end
