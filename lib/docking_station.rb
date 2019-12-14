require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity 
  CAPACITY = 20

  def initialize
    @capacity = CAPACITY
    @bikes = []
  end 

  def release_bike(bike)
    fail "No bikes available" if empty?
    @bikes.pop
  end 

  def dock(bike)
    fail "Docking station full" if full?
    @bikes << bike
  end 

  private

  def empty?
    @bikes.length == 0
  end 

  def full?
    @bikes.length == CAPACITY 
  end 
  
end 