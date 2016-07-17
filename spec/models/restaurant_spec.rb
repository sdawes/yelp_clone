require 'spec_helper'

describe "RESTAURANT SPEC" do

  describe Restaurant, type: :model do
    scenario 'is not valid with a name of less than three characters' do
      restaurant = Restaurant.new(name: "kf")
      expect(restaurant).to have(1).error_on(:name)
      expect(restaurant).not_to be_valid
    end

    it 'is not valid unless it has a unique name' do
      should validate_uniqueness_of(:name)
    end

  end
end
