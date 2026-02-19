class BasketsController < ApplicationController
  def show
    @basket = current_basket
    @items = @basket.basket_items.includes(:event).order("events.start_time")
  end
end
