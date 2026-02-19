require 'rails_helper'

RSpec.describe Basket, type: :model do
  describe "associations" do
    it "has many basket_items" do
      basket = create(:basket)
      event = create(:event)
      basket.basket_items.create!(event: event)
      expect(basket.basket_items.count).to eq(1)
    end

    it "has many events through basket_items" do
      basket = create(:basket)
      event = create(:event)
      basket.basket_items.create!(event: event)
      expect(basket.events).to include(event)
    end

    it "destroys basket_items when basket is destroyed" do
      basket = create(:basket)
      event = create(:event)
      basket.basket_items.create!(event: event)
      expect { basket.destroy }.to change(BasketItem, :count).by(-1)
    end
  end

  describe "find_or_create_by pattern" do
    it "finds an existing basket by session token" do
      basket = create(:basket, session_token: "abc123")
      found = Basket.find_or_create_by(session_token: "abc123")
      expect(found.id).to eq(basket.id)
    end

    it "creates a new basket when token is not found" do
      expect {
        Basket.find_or_create_by(session_token: "new_token_xyz")
      }.to change(Basket, :count).by(1)
    end
  end

  describe "#total_pounds" do
    it "returns the sum of event prices in pounds" do
      basket = create(:basket)
      create_list(:event, 2, price_pence: 1000).each do |event|
        basket.basket_items.create!(event: event)
      end
      expect(basket.total_pounds).to eq(20.0)
    end

    it "returns 0.0 for an empty basket" do
      basket = create(:basket)
      expect(basket.total_pounds).to eq(0.0)
    end
  end
end
