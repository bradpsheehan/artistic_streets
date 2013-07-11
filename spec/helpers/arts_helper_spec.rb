require 'spec_helper'

describe ArtsHelper do
  # describe "#art objects"
  #   it "creates and array of art objects"
  #     helper.art_objects(arts).should

  #   end
  # end

  describe '#info_window_content' do
    it 'sets up html for the particular piece of art' do
      pending 'how do i stub images?'
      
      art = FactoryGirl.create(:art)
      images = Image.new()
      art.stub(:images).and_return(images)
     
      content = info_window_content(art)
      expected_content = 
<<-eos
<div id="content"></div>
<div id="siteNotice">
</div>
<h4>#{t('headings.art_title')}</h4>
<p id="firstHeading" class="firstHeading">#{art.title}</p>
<h4>Artist:</h4>
<p id="secondHeading" class="secondHeading">#{art.artist}</p>
<h4>Location:</h4>
<p id="secondHeading" class="secondHeading">#{art.location[:address]}</p>
<div id="bodyContent" class="row">
<div class="large-11 large-centered columns">
<img src="#{art.images.first.image.url(:medium)}">
</div>
</div>
</div>
eos

      expect(content).to eq expected_content
    end
  end
end
