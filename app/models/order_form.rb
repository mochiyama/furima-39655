class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :prefecture_id, :city, :street_number, :name_of_building, :telephone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :street_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
  end
  def save(params,user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, street_number: street_number, name_of_building: name_of_building, telephone_number: telephone_number, order_id: order.id)
  end
end