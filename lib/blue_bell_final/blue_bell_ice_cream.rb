class BlueBellFinal::BlueBellIceCream

  ##this class must initiallize with the name(title), size, description, and nutrition
    
  attr_accessor :name, :size, :description, :nutrition
    
  @@all = []
    
  def initialize(name, size, description, nutrition)
    @name = name
    @size = size
    @description = description
    @nutrition = nutrition
    @@all << self
  end
    
  def self.all
    @@all
  end
    
  def self.find_by_index(index)
    @@all[index]
  end    
end


  
