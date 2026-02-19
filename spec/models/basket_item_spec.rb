require 'rails_helper'

RSpec.describe BasketItem, type: :model do
  describe "associations" do
    it "belongs to a basket" do
      item = create(:basket).basket_items.create!(event: create(:event))
      expect(item.basket).to be_a(Basket)
    end

    it "belongs to an event" do
      item = create(:basket).basket_items.create!(event: create(:event))
      expect(item.event).to be_a(Event)
    end
  end

  describe "uniqueness constraint" do
    it "prevents the same event being added to the same basket twice" do
      basket = create(:basket)
      event = create(:event)
      basket.basket_items.create!(event: event)

      duplicate = basket.basket_items.build(event: event)
      expect(duplicate).not_to be_valid
      expect(duplicate.errors[:event_id]).to include("is already in your basket")
    end

    it "allows the same event in different baskets" do
      event = create(:event)
      basket1 = create(:basket)
      basket2 = create(:basket)

      basket1.basket_items.create!(event: event)
      expect(basket2.basket_items.build(event: event)).to be_valid
    end

    it "allows different events in the same basket" do
      basket = create(:basket)
      event1 = create(:event)
      event2 = create(:event)

      basket.basket_items.create!(event: event1)
      expect(basket.basket_items.build(event: event2)).to be_valid
    end
  end
end
