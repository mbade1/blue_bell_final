class IceCream::BlueBellIceCream

  attr_accessor :name, :brand, :site, :price
    
  @@all = []
    
  def initialize(name, brand, site, price)
    @name = name
    @brand = brand
    @site = site
    @price = price
    @@all << self
  end
    
  def self.all
    @@all
  end
    
  def self.find_by_index(index)
    @@all[index]
  end    
end


  
