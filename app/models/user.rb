class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,             presence: true
  
  
  validates :last_name_kanji,      presence: true, format: { with: /\A[\p{Han}\p{Hiragana--}]+\z/, message: "must be in full-width kanji" }
  validates :first_name_kanji,     presence: true, format: { with: /\A[\p{Han}\p{Hiragana--}]+\z/, message: "must be in full-width kanji" }
  validates :last_name_kana,       presence: true, format: { without: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'must be in full-width Katakana'}
  validates :first_name_kana,      presence: true, format: { without: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'must be in full-width katakana'}
  validates :birth_day,            presence: true
  validates :password,             format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "must be in half-width alphanumeric characters" }, length: { minimum: 6 }
  validates :email,                uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "@ must include in email address" }
    

  #一時的に保留する 12月16日 20:30
  #has_many :items
  #has_many :purchasing_infos
   
end
