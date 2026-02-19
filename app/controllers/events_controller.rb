class EventsController < ApplicationController
  def index
    @events = Event.order(:start_time).includes(:basket_items)
  end
end
