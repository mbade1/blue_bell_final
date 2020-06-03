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
    doc = Nokogiri::HTML(open("https://www.bluebell.com/our-products/"))

    flavor = self.new
    flavor.name = doc.search("h4.description__title").text

    #flavor = doc.css("div.products")
    #flavor.size = doc.search("h4#description__title").text
    #flavor.description = doc.search("h4#description__title h5").text
    #flavor.url = doc.search("img#description__preview__image").attr("src")
    flavor

    end

  end



  
