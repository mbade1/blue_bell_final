class BlueBellFinal::BlueBellIceCream
    attr_accessor :name, :size, :description, :url
  
  def self.all
    #I should return all instances of flavors
    flavor_1 = self.new
    flavor_1.name = "Chocolate"
    flavor_1.size = "Half Gallon"
    flavor_1.description = "Yummy chocolate ice cream."
    flavor_1.url = "https://www.bluebell.com/our-products/#dutch-chocolate-year-round"
    
    flavor_2 = self.new
    flavor_2.name = "Cookies 'n Cream"
    flavor_2.size = "Half Gallon"
    flavor_2.description = "Yummy cookies 'n cream ice cream."
    flavor_2.url = "https://www.bluebell.com/our-products/#cookies-n-cream-year-round"

    [flavor_1, flavor_2]

  end

end
