require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it "is valid with all required attributes" do
      expect(build(:event)).to be_valid
    end

    it "is invalid without a title" do
      expect(build(:event, title: nil)).not_to be_valid
    end

    it "is invalid without a location" do
      expect(build(:event, location: nil)).not_to be_valid
    end

    it "is invalid without a start_time" do
      expect(build(:event, start_time: nil)).not_to be_valid
    end

    it "is invalid without an end_time" do
      expect(build(:event, end_time: nil)).not_to be_valid
    end

    it "is invalid without a capacity" do
      expect(build(:event, capacity: nil)).not_to be_valid
    end

    it "is invalid without a price_pence" do
      expect(build(:event, price_pence: nil)).not_to be_valid
    end

    it "is invalid with negative spots_remaining" do
      expect(build(:event, spots_remaining: -1)).not_to be_valid
    end
  end

  describe "associations" do
    it "has many basket_items" do
      event = create(:event)
      basket = create(:basket)
      basket.basket_items.create!(event: event)
      expect(event.basket_items.count).to eq(1)
    end

    it "destroys associated basket_items when deleted" do
      event = create(:event)
      basket = create(:basket)
      basket.basket_items.create!(event: event)
      expect { event.destroy }.to change(BasketItem, :count).by(-1)
    end
  end

  describe "#price_pounds" do
    it "converts pence to pounds" do
      event = build(:event, price_pence: 1400)
      expect(event.price_pounds).to eq(14.0)
    end
  end

  describe "#sold_out?" do
    it "returns true when spots_remaining is 0" do
      expect(build(:event, spots_remaining: 0).sold_out?).to be true
    end

    it "returns false when spots are available" do
      expect(build(:event, spots_remaining: 5).sold_out?).to be false
    end
  end
end
