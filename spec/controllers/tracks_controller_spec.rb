# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TracksController, type: :controller do
  describe '#index' do
    context 'with track_name' do
      before do
        get :index, params: { track_name: 'track_name' }
      end

      # it 'redners index' do
      #   expect(response).to render_template :index
      end
    end

    context 'without track_name' do
      before do
        get :index, params: { track_name: '' }
      end

      # it 'redirects to root_path' do
      #   expect(response).to redirect_to(root_path)
      # end
    end
  end

  describe '#show' do
    # it 'renders the :show template' do
    #   get :show, params: { spotify_id: '3LGRrDmbePCJb4nnkwZSRJ' }
    #   expect(response).to render_template :show
    # end
  end
end
