require 'rails_helper'
describe SnsCredential do
  describe '#create' do

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

  end
end
