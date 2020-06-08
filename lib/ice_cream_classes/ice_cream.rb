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

###LINE 30 BELOW IS CHANGED WITH .sort_by! TO MODIFY THE ORIGINAL @@all ARRAY###

  def self.alpha
    @@all.sort_by! { |flavor| flavor.name }
  end
  
end


  
