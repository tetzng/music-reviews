# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Track, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with spotify_id, name, track_number, duration_ms' do
        expect(build(:track)).to be_valid
      end

      it 'is valid without preview_url' do
        expect(build(:track, preview_url: nil)).to be_valid
      end
    end

    context 'cannot save' do
      it 'is invalid without spotify_id' do
        track = build(:track, spotify_id: nil)
        track.valid?
        expect(track.errors[:spotify_id]).to include('を入力してください')
      end

      it 'is invalid without name' do
        track = build(:track, name: nil)
        track.valid?
        expect(track.errors[:name]).to include('を入力してください')
      end

      it 'is invalid without track_number' do
        track = build(:track, track_number: nil)
        track.valid?
        expect(track.errors[:track_number]).to include('を入力してください')
      end

      it 'is invalid without duration_ms' do
        track = build(:track, duration_ms: nil)
        track.valid?
        expect(track.errors[:duration_ms]).to include('を入力してください')
      end

      it 'is invalid with a duplicate spotify_id' do
        track = create(:track)
        another_track = build(:track, spotify_id: track.spotify_id)
        another_track.valid?
        expect(another_track.errors[:spotify_id]).to include('はすでに存在します')
      end
    end
  end
end
