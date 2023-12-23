class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,             presence: true
  
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name_kanji
    validates :last_name_kanji
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :birth_day,            presence: true
  validates :password,             format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "must be in half-width alphanumeric characters" }
 
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'


  #一時的に保留する 12月16日 20:30
  #has_many :items
  #has_many :purchasing_infos
   
end
