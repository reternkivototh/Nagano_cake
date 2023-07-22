class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }

end
