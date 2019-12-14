require 'docking_station'
require 'bike'

describe DockingStation do 

  describe '#initialize' do
    it 'initializes with a capacity of 15' do 
      docking_station = DockingStation.new(DockingStation::CAPACITY)
      expect(docking_station.capacity).to eq DockingStation::CAPACITY
    end

    it 'initializes with no bikes in it' do
        expect(subject.bikes).to be_empty
    end 

    it 'allows capacity to be changed when needed' do
      subject.capacity = 12
      expect(subject.capacity).to eq 12
    end 

    it 'has a default capacity of 20' do
      expect(subject.capacity).to eq 20
    end 

  end 
  
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
      expect(subject.dock(bike)).to eq [bike]
    end  

    it 'remembers the bike that has been docked' do
      bike = Bike.new 
      subject.dock(bike)
      expect(subject.bikes).to eq [bike] 
    end 

    it 'raises an error if there is docking station is at capacity' do
      15.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new) }.to raise_error "Docking station full"
    end 
  end 

end 