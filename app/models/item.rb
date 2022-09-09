class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :name, presence: true
  validates :text, presence: true
  validates :price, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :status_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :sender_id, presence: true
  validates :shippedd_date_id, presence: true

end
