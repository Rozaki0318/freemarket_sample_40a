class User < ApplicationRecord
  has_many :sns_credentials
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  
  validates :nickname, presence: true, length: { maximum: 12 }
  

  def self.find_for_oauth(auth)
    snscredential = SnsCredential.where(uid: auth.uid, provider: auth.provider).first
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user.id
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0, 20]
          )
        user_id = user.id
        SnsCredential.create(
          uid: auth.uid,
          provider: auth.provider,
          user_id: user_id
          )
      end
      user
    end
  end
end
