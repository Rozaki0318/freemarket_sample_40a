class CreditCard < ApplicationRecord
  belongs_to :user
  validates :number, presence: true
  validates :security_code, presence: true
end
