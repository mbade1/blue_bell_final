class BlueBellFinal::Scraper
  def self.scrape
  end
end




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

    flavor = doc.css("div.section__content")
    flavor.each do |flavor_info|


    flavor = self.new
    flavor.name = doc.search("#class-name id, etc.").text
    flavor.size = doc.search("").text
    flavor.description = doc.search("").text
    flavor.url = doc.search("a.class-name").attr("href")
    binding.pry

    flavor

  end

