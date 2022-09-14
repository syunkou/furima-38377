class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :sender
  belongs_to :shippedd_date

  validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :sender_id
    validates :shippedd_date_id
    validates :image
  end

  with_options numericality: { other_than: 0} do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :sender_id
    validates :shippedd_date_id
  end
  



end
