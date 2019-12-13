# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do
  describe '#index' do
    context 'with artist_name' do
      before do
        get :index, params: { artist_name: 'artist_name' }
      end

      # it 'redners index' do
      #   expect(response).to render_template :index
      # end
    end

    context 'without artist_name' do
      before do
        get :index, params: { artist_name: '' }
      end

      # it 'redirects to root_path' do
      #   expect(response).to redirect_to(root_path)
      # end
    end
  end

  describe '#show' do
    # it 'renders the :show template' do
    #   get :show, params: { spotify_id: '0KDuKk6YdEu3hR56HtXmxt' }
    #   expect(response).to render_template :show
    # end
  end
end
