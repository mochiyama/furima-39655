class Item < ApplicationRecord
    belongs_to :user
    has_one    :order
    
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :shipping_fee
    belongs_to :ship_from
    belongs_to :shipping_date

  
  has_one_attached :image
  
  validates :image,              presence: true 

  validates :item_name,          presence: true
  validates :description,        presence: true


  validates :category_id,         numericality: { other_than: 1, message: "は選択されていません"}
  validates :condition_id,        numericality: { other_than: 1, message: "は選択されていません"}
  validates :shipping_fee_id,     numericality: { other_than: 1, message: "は選択されていません"}
  validates :ship_from_id,        numericality: { other_than: 1, message: "は選択されていません"}
  validates :shipping_date_id,    numericality: { other_than: 1, message: "は選択されていません"}

           
  validates :price,               presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "300円以上 もしくは 9,999,999円以下で出品してください"}, format: { with: /\A[0-9]+\z/, message: "半角で入力してください" }
  


end