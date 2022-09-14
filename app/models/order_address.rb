class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zipcode, :status_id, :city, :address1, :address2, :phone_number

  with_options presence: true do
    # orderのバリデーション
    validates :user_id
    validates :item_id
    # addressのバリデーション
    validates :zipcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :status_id, numericality: { other_than: 0}
    validates :city
    validates :address1
    validates :phone_number, format: { with: /\A[0-9]+{11}\z/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, zipcode: zipcode, status_id: status_id, city: city, address1: address1, address2: address2, phone_number: phone_number)
  end
end