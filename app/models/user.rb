class User < ApplicationRecord
  has_many :sns_credentials
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.find_for_oauth(auth)
    snscredential = SnsCredential.where(uid: auth.uid, provider: auth.provider).first
    if snscredential ==! nil
    user = User.where(id: snscredential.user_id).first
    else
      user = User.create(
        nickname: auth.info.name,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
      @user_id = user.id
      SnsCredential.create(
        uid: auth.uid,
        provider: auth.provider,
        user_id: @user_id)
    end

    user
  end

end
