require 'rails_helper'

RSpec.describe "Basket flow", type: :system do
  let!(:event) { create(:event, title: "Morning Vinyasa Flow", price_pence: 1200) }
  let!(:event2) { create(:event, title: "HIIT Circuit", price_pence: 1000) }

  scenario "user adds an event to the basket" do
    visit events_path

    expect(page).to have_content("Morning Vinyasa Flow")

    within("turbo-frame#event_#{event.id}") do
      click_button "Add to basket"
    end

    within("turbo-frame#basket") do
      expect(page).to have_content("Morning Vinyasa Flow")
      expect(page).to have_content("1 item")
      expect(page).to have_content("£12.00")
    end

    within("turbo-frame#event_#{event.id}") do
      expect(page).to have_content("Added ✓")
    end
  end

  scenario "user removes an event from the basket" do
    visit events_path

    within("turbo-frame#event_#{event.id}") do
      click_button "Add to basket"
    end

    within("turbo-frame#basket") do
      expect(page).to have_content("1 item")
      click_button "✕"
    end

    within("turbo-frame#basket") do
      expect(page).to have_content("Your basket is empty")
    end

    within("turbo-frame#event_#{event.id}") do
      expect(page).to have_button("Add to basket")
    end
  end

  scenario "duplicate event cannot be added twice" do
    visit events_path

    within("turbo-frame#event_#{event.id}") do
      click_button "Add to basket"
    end

    within("turbo-frame#basket") do
      expect(page).to have_content("1 item")
    end

    # Button is now "Added ✓" — clicking add again is not possible
    within("turbo-frame#event_#{event.id}") do
      expect(page).not_to have_button("Add to basket")
      expect(page).to have_content("Added ✓")
    end

    # Basket count has not increased
    within("turbo-frame#basket") do
      expect(page).to have_content("1 item")
    end
  end
end
