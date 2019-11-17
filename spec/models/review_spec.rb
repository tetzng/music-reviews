# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with rate, review, user_id, track_spotify_id' do
        expect(build(:review)).to be_valid
      end

      it 'is valid without rate' do
        expect(build(:review, rate: nil)).to be_valid
      end

      it 'is valid without review' do
        expect(build(:review, review: nil)).to be_valid
      end

      it 'is valid without rate, review' do
        expect(build(:review, rate: nil, review: nil, user_id: 1)).to be_valid
      end

      it 'is valid without user_id' do
        expect(build(:review, user_id: nil)).to be_valid
      end

      it 'is valid without rate, user_id' do
        expect(build(:review, rate: nil, user_id: nil)).to be_valid
      end

      it 'is valid without review, user_id' do
        expect(build(:review, review: nil, user_id: nil)).to be_valid
      end

      it 'is valid with rate that is equal to 0' do
        review = build(:review, rate: 0)
        expect(review).to be_valid
      end

      it 'is valid with rate that is equal to 5' do
        review = build(:review, rate: 5)
        expect(review).to be_valid
      end
    end

    context 'cannot save' do
      it 'is invalid without track_spotify_id' do
        review = build(:review, track_spotify_id: nil)
        review.valid?
        expect(review.errors[:track]).to include('must exist')
      end

      it 'is invalid without rate, review, user_id' do
        review = build(:review, rate: nil, review: nil, user_id: nil)
        review.valid?
        expect(review.errors[:rate]).to include("can't be blank")
      end

      it 'is invalid with rate that is greater than 5' do
        review = build(:review, rate: 5.1)
        review.valid?
        expect(review.errors[:rate]).to include('must be less than or equal to 5')
      end

      it 'is invalid with rate that is less than 0' do
        review = build(:review, rate: -0.1)
        review.valid?
        expect(review.errors[:rate]).to include('must be greater than or equal to 0')
      end
    end
  end
end
