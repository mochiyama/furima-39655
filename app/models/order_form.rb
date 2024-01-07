class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :item_name, :description, :price, :category_id, :condition_id, :shipping_fee_id, :ship_from_id, :shipping_date_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
  end
end
end