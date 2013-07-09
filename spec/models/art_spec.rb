require 'spec_helper'

describe Art do
  subject do
    Art.new(title: "Art Title", artist: "someone", comment: "A brilliant piece", location_attributes: {} )
  end

  it "requires a location" do
    expect { subject.location = nil }.to change { subject.valid? }.to be_false
  end

  describe '#to_map_art' do
    it 'prepares a hash for map display' do
      art = Art.new( artist: 'Anonymous', title: 'Best Art Ever', location_attributes:{} )
      expected_results = {
                          artist: 'Anonymous',
                          title: 'Best Art Ever',
                          lat:  nil,
                          long: nil,
                          image: "/images/original/missing.png"
                          }
      expect(art.to_map_art).to eq expected_results
    end
  end

  describe 'has zero or more images' do
    it 'does not have to have an image' do
      expect(subject).to be_valid
    end

    it 'can have one image' do
      art = Art.create(title: 'Art Title', artist: 'Unknown', location_attributes: {})
      image = art.images.new ({:photo => File.new(Rails.root + 'spec/support/rails.png')})
      
    end

    it 'can have many images' do
      pending 'write me'
    end
  end
end
