require 'docking_station'
require 'bike'

describe DockingStation do 
  describe '#release_bike' do
    it { is_expected.to respond_to(:release_bike).with(1).argument }
    
    it 'releases a working bike' do
      bike = Bike.new
      subject.dock(bike)
      subject.release_bike(bike)
      expect(bike).to be_working
    end 

    it 'raises an error when there are no bikes available to release' do
      bike = Bike.new
      expect { subject.release_bike(bike) }.to raise_error "No bikes available"
    end 
  end

  describe '#dock' do
    it 'docks a bike at the docking station' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end 

    it 'remembers the bike that has been docked' do
      bike = Bike.new 
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end 

    it 'raises an error if there is already a bike in the docking station' do
      bike = Bike.new
      subject.dock(bike)
      expect { subject.dock(bike) }.to raise_error "Docking station full"
    end 
  end 

# As a member of the public
# So I can decide whether to use the docking station
# I want to see a bike that has been docked
end 