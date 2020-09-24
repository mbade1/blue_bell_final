class IceCream::BlueBellIceCream

  attr_accessor :name, :brand, :site, :price
    
  @@all = []
    
  def initialize(name, brand, site, price)
    @name = name
    @brand = brand
    @site = site
    @price = price
    save
  end
  
  def save
    @@all << self
  end
    
  def self.all
    @@all
  end
    
  def self.find_by_index(index)
    @@all[index]
  end    
end


  
