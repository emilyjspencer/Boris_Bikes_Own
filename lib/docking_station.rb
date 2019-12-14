require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity 
  CAPACITY = 20

  def initialize
    @capacity = CAPACITY
    @bikes = []
  end 

  def release_bike(bike)
    fail "No bikes available" if @bikes.length == 0
    @bikes.pop
  end 

  def dock(bike)
    fail "Docking station full" if @bikes.length == CAPACITY 
    @bikes << bike
  end 


  
  
end 