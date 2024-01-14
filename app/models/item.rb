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


  validates :category_id,         numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id,        numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_fee_id,     numericality: { other_than: 1, message: "can't be blank"}
  validates :ship_from_id,        numericality: { other_than: 1, message: "can't be blank"}
  validates :shipping_date_id,    numericality: { other_than: 1, message: "can't be blank"}

           
  validates :price,               presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "must be greater than 299 or less than 10000000"}, format: { with: /\A[0-9]+\z/, message: "must be half-width" }
  


end