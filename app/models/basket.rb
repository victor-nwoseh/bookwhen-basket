class Basket < ApplicationRecord
  has_many :basket_items, dependent: :destroy
  has_many :events, through: :basket_items

  def total_pence
    events.sum(:price_pence)
  end

  def total_pounds
    total_pence / 100.0
  end
end
