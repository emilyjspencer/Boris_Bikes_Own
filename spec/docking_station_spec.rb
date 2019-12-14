require 'docking_station'
require 'bike'

describe DockingStation do 

  it { is_expected.to respond_to(:release_bike).with(1).argument }
  # Add a test to your DockingStation specification that a) gets a bike, and then b) expects the bike to be working
  it 'releases a working bike' do
    bike = Bike.new
    subject.release_bike(bike)
    expect(bike).to be_working
  end 
end 