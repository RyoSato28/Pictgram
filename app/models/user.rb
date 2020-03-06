class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 15 }
  
  # validates :email, presence: true
  MAIL_REDEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: MAIL_REDEX }
  
  has_secure_password
  # validates :password, length: { minimum: 8, maximum: 32 }
  PW_REDEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
  validates :password, presence: true, format: { with: PW_REDEX }
  
  has_many :topics
end
