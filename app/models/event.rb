class Event < ApplicationRecord
  has_many :basket_items, dependent: :destroy
  has_many :baskets, through: :basket_items

  validates :title, :location, :start_time, :end_time, :capacity, :price_pence, presence: true
  validates :spots_remaining, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def price_pounds
    price_pence / 100.0
  end

  def sold_out?
    spots_remaining.to_i <= 0
  end
end
