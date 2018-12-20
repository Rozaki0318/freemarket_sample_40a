require 'rails_helper'
describe SnsCredential do
  describe '#create' do

    # # 名前メアドパス再パスがあれば登録できる
    # it "is valid with a nickname, email, password, password_confirmation" do
    #   user = build(:user)
    #   expect(user).to be_valid
    # end

    # # ニックネームがなければ登録できない
    # it "is invalid without a nickname" do
    #   user = build(:user, nickname: nil)
    #   user.valid?
    #   expect(user.errors[:nickname]).to include("can't be blank")
    # end

    # # メアドがなければ登録できない
    # it "is invalid without a email" do
    #   user = build(:user, email: nil)
    #   user.valid?
    #   expect(user.errors[:email]).to include("can't be blank")
    # end

    # user_ideがあれば登録できる
    it "is valid with a user_id" do
      sns_credential = build(:sns_credential)
      expect(sns_credential).to be_valid
    end

    # user_idがなければ登録できない
    it "is invalid without a user_id" do
      sns_credential = build(:sns_credential, user_id: nil)
      sns_credential.valid?
      expect(sns_credential.errors[:user_id]).to include("can't be blank")
    end

    # # パスがあっても再パスがなければ登録できない
    # it "is invalid without a password_confirmation although with a password" do
    #   user = build(:user, password_confirmation: "")
    #   user.valid?
    #   expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    # end

    # # 名前が13文字以上は登録できない
    # it "is invalid with a nickname that has more than 12 characters" do
    #   user = build(:user, nickname: "aaaaaaaaaaaaa")
    #   user.valid?
    #   expect(user.errors[:nickname][0]).to include("is too long")
    # end

    # # 名前が12文字以下だと登録できる
    # it "is valid with a nickname that has less than 13 characters" do
    #   user = build(:user, nickname: "aaaaaaaaaaaa")
    #   expect(user).to be_valid
    # end

    # # メアドがかぶると登録できない
    # it "is invalid with a duplicate email address" do
    #   #はじめにユーザーを登録
    #   user = create(:user)
    #   #先に登録したユーザーと同じemailの値を持つユーザーのインスタンスを作成
    #   another_user = build(:user, email: user.email)
    #   another_user.valid?
    #   expect(another_user.errors[:email]).to include("has already been taken")
    # end

    # # パスが五文字以下だと登録できない
    # it "is invalid with a password that has less than 6 characters" do
    #   user = build(:user, password: "00000", password_confirmation: "00000")
    #   user.valid?
    #   expect(user.errors[:password][0]).to include("is too short")
    # end

    # # パスが6文字以上だと登録できる
    # it "is valid with a password that has more than 5 characters" do
    #   user = build(:user, password: "000000", password_confirmation: "000000")
    #   user.valid?
    #   expect(user).to be_valid
    # end

  end

end
