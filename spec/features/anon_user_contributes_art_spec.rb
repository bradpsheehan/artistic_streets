require 'spec_helper'

describe "user can contribute art to the documentary" do
  it "can navigate to the contribution page" do
    visit root_path
    click_link 'Contribute'
    expect( page ).to have_selector('#art_title')
  end

  it "can contribute to the documentary of public art" do
    visit new_art_path
    fill_in 'art[title]',  :with   => 'Giant Face'
    fill_in 'art[artist]', :with   => 'Banksy'
    fill_in 'art[comment]',:with   => 'This one is hard to miss.'
    fill_in 'art[location_attributes][address]',:with => '123 Fake St Denver CO'
    click_on "submit"
    expect( current_path ).to eq arts_path
  end

  context 'when there is already art with a photo', js: true do
    it 'adds another photo to the art piece' do
      art = Art.create(title: 'Hello', artist: 'what', location_attributes: {latitude: 42.365, longitude:-71.0})
      visit discover_path

      within("#map_canvas") do
        expect(page).to have_selector('Hello')
        # find(:xpath, "//div[@class='gmnoprint' and @title=#{art.title}]").click

        # selenium.click("xpath=(//div[@class='gmnoprint' and @title])")
        # save_and_open_page
      end
      #click on it
      #within the sidepanel, expect that theres a link
      #click the link
      #upload the photo
      #expect to see the photo sidebar/ flash message/ check db to see its added
    end
  end
end
