require 'rails_helper'

RSpec.describe "Tags page", type: :feature do
  before do
    @nature = Tag.create(name: "nature")
  end

  it "should render correctly" do
    visit '/tags'
    expect(page).to have_text("nature")
  end
end
