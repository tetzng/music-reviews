# frozen_string_literal: true

require 'rails_helper'

describe ReviewsController, type: :controller do
  let(:track) { create(:track, spotify_id: "3LGRrDmbePCJb4nnkwZSRJ") }
  let(:user) { create(:user) }

  describe '#create' do
    context 'can save' do
      let(:params) { { rate: 2.5, review: "hoge", track_spotify_id: track.spotify_id, user_id: user.id } }

      subject {
        post :create,
        params: params
      }

      it 'count up review' do
        expect{ subject }.to change(Review, :count).by(1)
      end

      it 'redirects to track_path' do
        subject
        expect(response).to redirect_to(track_path(track.spotify_id))
      end
    end

    context 'can not save' do
      let(:invalid_params) { { rate: nil, review: nil, track_spotify_id: track.spotify_id, user_id: nil } }

      subject {
        post :create,
        params: invalid_params
      }

      it 'does not count up' do
        expect{ subject }.not_to change(Review, :count)
      end

      it 'redirects to track_path' do
        subject
        expect(response).to redirect_to(track_path(track.spotify_id))
      end
    end
  end
end
