require 'spec_helper'

describe Art do
  subject do
    Art.new(title: "Art Title", artist: "someone", comment: "A brilliant piece", location_attributes: {} )
  end

  it "requires a location" do
    expect { subject.location = nil }.to change { subject.valid? }.to be_false
  end

  
  it "returns a hash of attributes for map info window" do
    
  end

end
