require 'docking_station'
require 'bike'

describe DockingStation do 
  describe '#release_bike' do
    it { is_expected.to respond_to(:release_bike).with(1).argument }
    
    it 'releases a working bike' do
      bike = Bike.new
      subject.release_bike(bike)
      expect(bike).to be_working
    end 
  end

  describe '#dock' do
    it 'docks a bike at the docking station' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end 

    it 'stores the bike that has been docked' do
      bike = Bike.new 
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end 
  end 

# As a member of the public
# So I can decide whether to use the docking station
# I want to see a bike that has been docked
end 