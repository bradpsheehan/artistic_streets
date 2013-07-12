require 'spec_helper'

describe Art do
  subject do
    Art.new(title: "Art Title", artist: "someone", comment: "A brilliant piece", location_attributes: {} )
  end

  it "requires a location" do
    expect { subject.location = nil }.to change { subject.valid? }.to be_false
  end

  describe 'image_tags' do
    it 'makes html image tags' do
      image = subject.images.build
      image2 = subject.images.build
      image.stub(:url).and_return('http://placegoat.com/150/150')
      image2.stub(:url).and_return('http://placegoat.com/100/100')
      subject.save

      expect(subject.image_tags).to eq "<img src='http://placegoat.com/150/150'> <img src='http://placegoat.com/100/100'>" 
    end
  end

  describe '#image_urls' do
    context 'when there are no images' do
      it 'returns an array with one missing image url in it' do
        expect(subject.image_urls).to eq(['http://placegoat.com/300/300'])
      end
    end

    context 'when there are images' do
      it 'returns an array of image urls' do
        image1 = subject.images.build
        image2 =subject.images.build
        image1.stub(:url).and_return('http://placegoat.com/150/150')
        image2.stub(:url).and_return('http://placegoat.com/100/100')
        subject.save

        expect(subject.image_urls).to eq ['http://placegoat.com/150/150', 'http://placegoat.com/100/100']
      end
    end
  end

  describe '#to_map_art' do
    it 'prepares a hash for map display' do
      image = subject.images.build
      image.stub(:url).and_return('http://placegoat.com/150/150')
      subject.save

      expected_results = {
                            id: subject.id,
                            artist: 'someone',
                            title: 'Art Title',
                            comment: "A brilliant piece",
                            lat: nil,
                            long: nil,
                            image: ['http://placegoat.com/150/150']
                          }
      expect(subject.to_map_art).to eq expected_results
    end
  end
end
