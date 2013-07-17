require 'spec_helper'

describe ArtsController do
  describe 'GET#index' do
    it 'assigns the arts variable' do
      art = Art.create(title: 'testing', comment: 'testing', artist:'testing', location_attributes: {} )
      get :index
      expect(assigns(:arts)).to eq([art])
    end
  end

  describe 'GET#show' do
    it 'returns json for a particular piece of art' do
      pending 
      # art
      # get :show
      # expect(response)...... to render json with image list
    end
  end

  describe 'POST#create' do
  end
  
  describe 'GET#count' do
    it 'returns a count of all the art' do
      pending
      # art = Art.create(title: 'testing', comment: 'testing', artist:'testing', location_attributes: {} )
      # get :count
      # expect(response).to be "{'count': '1'}"
    end
  end
end
