require 'open-uri'
require 'nokogiri'

class BlueBellFinal::BlueBellIceCream

  attr_accessor :name, :size, :description, :url

  def self.all
    #Scrape Blue Bell Ice Cream Site and return the name, size, description, and url on that data.
    @@all
    self.scrape_flavors
  end
  
  def self.scrape_flavors
    flavors = []
    flavors << self.scrape_blue_bell
    flavors
  end

  def self.scrape_blue_bell
    site = Nokogiri::HTML(open('https://www.bluebell.com/our-products/'))
  
    @@all = []
  
    product = site.css("div.products .description.tabs .description__wrapper .description__inner")
    product.each do |product_info|
  
      name = product_info.css(".description__aside h4.description__title").text
      size = "half-gallon"
      description = product_info.css(".description__body .description__content h5").text
      nutrition = product_info.css(".description__aside ul.description__menu .nutrition_tabs .description__submenu .nutrition-item a.tab__trigger").attr("href").text
  
      product_hash = {:name => name, :size => size, :description => description, :nutrition => nutrition}
      @@all << product_hash
      end
    @@all
  end
end



  
