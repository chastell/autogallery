require 'rails_helper'

RSpec.describe "Photos page", type: :feature do
  before do
    @photo = FactoryGirl.create(:photo)
  end

  it "should render correctly" do
    visit '/photos'
    expect(page).to have_text("All photos")
    expect(page).to have_css("img")
  end

  it "should display individual photos" do
    visit '/photos'
    find("a").click
    expect(page).to have_text("Beautiful photo")
  end
end
