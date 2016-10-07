require 'rails_helper'

RSpec.describe "Tags page", type: :feature do
  before do
    @nature = Tag.create(name: "nature")
    @indoor = Tag.create(name: "indoor")
    @photo = FactoryGirl.create(:photo)
    TaggedPhoto.create(photo: @photo, tag: @nature)
  end

  it "should render correctly" do
    visit '/tags'
    expect(page).to have_link("nature")
  end

  it "should display photos" do
    visit '/tags'
    click_link "nature"
    expect(page).to have_text("nature")
    expect(page).to have_css("img")
  end

  it "should not display photos in an empty tag" do
    visit '/tags'
    click_link "indoor"
    expect(page).not_to have_css("img")
  end
end
