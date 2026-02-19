class BasketItemsController < ApplicationController
  def create
    @item = current_basket.basket_items.find_or_create_by(event: Event.find(params[:event_id]))
    @event = @item.event
    @basket = current_basket
    respond_to { |f| f.turbo_stream }
  end

  def destroy
    @item = current_basket.basket_items.find(params[:id])
    @event = @item.event
    @item.destroy
    @basket = current_basket
    @items = @basket.basket_items.includes(:event).order("events.start_time")
    respond_to { |f| f.turbo_stream }
  end
end
