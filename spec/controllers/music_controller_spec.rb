require 'rails_helper'

describe MusicController, type: :controller do
  describe 'GET #index' do
    it "populates an array of tracks ordered by spotify_id ASC" do
      tracks = create_list(:track, 3)
      get :index
      expect(assigns(:tracks)).to match(tracks.sort{ |a, b| a.spotify_id <=> b.spotify_id })
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
