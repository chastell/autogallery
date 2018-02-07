require 'rails_helper'

RSpec.describe "Photos page", type: :feature do
  before do
    @photo = FactoryBot.create(:photo)
  end

  it "should render correctly" do
    visit '/photos'
    expect(page).to have_text("All photos")
    expect(page).to have_css("img")
  end

  it "should display individual photos" do
    visit '/photos'
    find_all("a").last.click
    expect(page).to have_text("Beautiful photo")
  end
end
