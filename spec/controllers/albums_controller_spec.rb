require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe '#index' do
    context 'with keyword' do
      before do
        get :index, params: { keyword: "keyword" }
      end

      it 'redners index' do
        expect(response).to render_template :index
      end
    end

    context 'without keyword' do
      before do
        get :index, params: { keyword: "" }
      end

      it 'redirects to root_path' do
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe '#show' do
    it 'renders the :show template' do
      get :show, params: { spotify_id: "6W6pGKjcVJVwbGHy2YRoeO" }
      expect(response).to render_template :show
    end
  end
end
