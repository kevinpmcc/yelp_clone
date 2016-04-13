require 'spec_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }

  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'does not validate if the name is not unique' do
    Restaurant.create(name: "Nando's")
    restaurant = Restaurant.new(name: "Nando's")
    expect(restaurant).to have(1).error_on(:name)
  end
end
