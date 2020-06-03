class BlueBellFinal::BlueBellIceCream

  attr_accessor :name, :size, :description, :url

  def self.all
    #Scrape Blue Bell Ice Cream Site and return the name, size, description, and url on that data.
    self.scrape_flavors
  end
  
  def self.scrape_flavors
    flavors = []
    flavors << self.scrape_blue_bell
    flavors
  end

  def self.scrape_blue_bell
    doc = Nokogiri::HTML(open('https://www.bluebell.com/our-products/'))
    flavor = self.new

    flavor.name = doc.search("h4.description__title").text
    flavor.size = "half gallon"
    flavor.description = doc.search(".description__body .description__content h5").text
    flavor.url = doc.search("a.tab__trigger").attr("href")
    flavor
  end
end



  
