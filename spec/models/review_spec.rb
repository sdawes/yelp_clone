require 'rails_helper'

describe '' do
  describe Review, type: :model do
    it 'is invalid if the rating is more than 5' do
      expect(Review.new(rating: 10)).to have(1).error_on(:rating)
    end

  end
end
