class BlueBellFinal::BlueBellIceCream

  ##this class must initiallize with the name(title), size, description, and nutrition
    
  attr_accessor :name, :price, :price_per_pack_or_oz
    
  @@all = []
    
  def initialize(name, price, price_per_pack_or_oz)
    @name = name
    @price = price
    @price_per_pack_or_oz = price_per_pack_or_oz
    @@all << self
  end
    
  def self.all
    @@all
  end
    
  def self.find_by_index(index)
    @@all[index]
  end    
end


  
