require 'rails_helper'

describe MusicController, type: :controller do
  describe 'GET #index' do
    it "populates an array of tracks" do
      tracks = create_list(:track, 3)
      get :index

    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
