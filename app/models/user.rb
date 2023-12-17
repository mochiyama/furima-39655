class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,             presence: true
  

  validates :last_name_kanji,      presence: true
  validates :first_name_kanji,     presence: true
  validates :last_name_kana,       presence: true
  validates :first_name_kana,      presence: true
  validates :birth_day,            presence: true
  validates :password,             format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,, message: "must be in half-width alphanumeric characters" }
  validates :last_name_kanji,      format: { with: /\A[\p{Han}\p{Katakana}\p{Hiragana--}]+\z/, message: "must be in full-width kanji, katakana or hiragana" }
  validates :first_name_kanji,     format: { with: /\A[\p{Han}\p{Katakana}\p{Hiragana--}]+\z/, message: "must be in full-width kanji, katakana or hiragana" }
  validates :last_name_kana,       format: { with: /\A[ァ-ヶー－]+\z/, message: "must be in full-width katakana" }
  validates :first_name_kana,      format: { with: /\A[ァ-ヶー－]+\z/, message: "must be in full-width katakana" }
 
  #一時的に保留する 12月16日 20:30
  #has_many :items
  #has_many :purchasing_infos
   
end
