class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_num, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :phone_num, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Exclude hyphone(-)' }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    Destination.create(post_code:, prefecture_id:, city:, address:, building:,
                       phone_num:, order_id: order.id)
  end
end
