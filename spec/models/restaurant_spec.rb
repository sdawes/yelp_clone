require 'spec_helper'

describe "======== UNIT TESTS ========" do

  describe Restaurant, type: :model do
    scenario 'is not valid with a name of less than three characters' do
      restaurant = Restaurant.new(name: "kf")
      expect(restaurant).to have(1).error_on(:name)
      expect(restaurant).not_to be_valid
    end

    scenario 'is not valid unless it has a unique name' do
      Restaurant.create(name: "Moe's Tavern")
      expect(Restaurant.new(:name => "Moe's Tavern")).to have(1).error_on(:name)
    end

  end
end
