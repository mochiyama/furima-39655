class Item < ApplicationRecord
    belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :shipping_fee
    belongs_to :ship_from
    belongs_to :shipping_date

  #空の投稿を保存できないようにする
  #validates :title, :text, presence: true #不要

  #ジャンルの選択が「---」の時は保存できないようにする


  #has_one :purchasing_info
  has_one_attached :image
  
  #validates :image,              presence: true #不要？でコメントアウトした

  validates :item_name,          presence: true
  validates :description,        presence: true

  validates :user,               presence: true
  validates :category_id,        presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id,       presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_fee_id,    presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :ship_from_id,       presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_date_id,   presence: true, numericality: { other_than: 1, message: "can't be blank"}

  validates :price,              presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は半角数字を使用してください"}

end