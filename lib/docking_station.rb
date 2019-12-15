require_relative 'bike'

class DockingStation
  attr_reader :bikes
  attr_accessor :capacity 
  CAPACITY = 15
  DEFAULT_CAPACITY = 20 

  def initialize(capacity = DEFAULT_CAPACITY) # if capacity not specified - defaults to 20
    @capacity = capacity
    @bikes = []
  end 

  def release_bike(bike)
    fail "No bikes available" if empty?
    fail "Bike unavailable" if bike.broken == true 
    @bikes.pop
  end 

  def dock(bike)
    fail "Docking station full" if full?
    @bikes << bike
    "Bike has been returned"
  end 

  private

  def empty?
    @bikes.length == 0
  end 

  def full?
    @bikes.length >= CAPACITY 
  end 
  
end 