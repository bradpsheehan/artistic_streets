require 'spec_helper'

describe "user can contribute art to the documentary" do
  it "can navigate to the contribution page" do
    visit root_path
    click_link 'Contribute'
    expect( page ).to have_selector('#new-art')
  end

  it "can contribute to the documentary of public art" do
    visit new_art_path
    fill_in 'art[title]',  :with   => 'Giant Face'
    fill_in 'art[artist]', :with   => 'Banksy'
    fill_in 'art[comment]',:with   => 'This one is hard to miss.'
    fill_in 'art[location_attributes][address]',:with => '123 Fake St Denver CO'
    click_on "submit"
    expect( current_path ).should eq arts_path
  end

end
