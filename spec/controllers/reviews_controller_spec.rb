# frozen_string_literal: true

require 'rails_helper'

describe ReviewsController, type: :controller do
  let(:track) { create(:track) }
  let(:user) { create(:user) }
  let(:another_user) { create(:another_user) }
  let(:review) { create(:review, user_id: user.id, track_spotify_id: '7BUBM2XnhnWnYZhGDU1Mvm') }

  describe '#create' do
    context 'can save' do
      let(:params) { { rate: 2.5, review: 'hoge', track_spotify_id: track.spotify_id, user_id: user.id } }

      subject do
        post :create,
             params: params
      end

      it 'count up review' do
        expect { subject }.to change(Review, :count).by(1)
      end

      it 'redirects to track_path' do
        subject
        expect(response).to redirect_to(track_path(track.spotify_id))
      end
    end

    context 'can not save' do
      let(:invalid_params) { { rate: nil, review: nil, track_spotify_id: track.spotify_id, user_id: nil } }

      subject do
        post :create,
             params: invalid_params
      end

      it 'does not count up' do
        expect { subject }.not_to change(Review, :count)
      end

      it 'redirects to track_path' do
        subject
        expect(response).to redirect_to(track_path(track.spotify_id))
      end
    end
  end

  describe '#edit' do
    context 'log in' do
      before do
        login user
        get :edit, params: { track_spotify_id: '7BUBM2XnhnWnYZhGDU1Mvm', id: review.id }
      end

      it 'assigns @review' do
        expect(assigns(:review)).to eq review
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end

    context 'log in by another user' do
      before do
        login another_user
        get :edit, params: { track_spotify_id: '7BUBM2XnhnWnYZhGDU1Mvm', id: review.id }
      end

      it 'redirects to root_path' do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'not log in' do
      before do
        get :edit, params: { track_spotify_id: '7BUBM2XnhnWnYZhGDU1Mvm', id: review.id }
      end

      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
