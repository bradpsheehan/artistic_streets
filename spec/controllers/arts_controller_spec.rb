require 'spec_helper'

describe ArtsController do
  describe 'PUT#update' do
    it 'updates an art object with an added image' do
      
      #stub the image creation process
      art = Art.create(title: 'hello', artist: 'someone', location_attributes: {} )
      art.should_receive(:update_attributes)

        put :update, id: art.id, image:{}
    end
  end
end
