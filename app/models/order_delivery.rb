class OrderDelivery 
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :order_id, :item_id, :user_id, :token


  validates :postcode,      presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :city,          presence: true
  validates :block,         presence: true
  validates :phone_number,  presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :token, presence: true

  def save
    @order_delivery = Order.create(user_id: user_id,item_id: item_id)
    Delivery.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: @order_delivery.id )
    end
end