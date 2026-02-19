class BasketItem < ApplicationRecord
  belongs_to :basket
  belongs_to :event

  validates :event_id, uniqueness: { scope: :basket_id, message: "is already in your basket" }
end
