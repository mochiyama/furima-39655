class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :ship_from_id, :city, :street_number, :name_of_building, :telephone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は無効です。ハイフンを入力して下さい"}
    validates :ship_from_id, numericality: {other_than: 1, message: "を入力してください"}
    validates :city
    validates :street_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/,message: "を入力してください"}
    validates :token
  end
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Purchase.create(order_id: order.id, zip_code: zip_code, ship_from_id: ship_from_id, city: city, street_number: street_number, name_of_building: name_of_building, telephone_number: telephone_number)
  end
end