require 'open-uri'
require 'nokogiri'

class IceCream::Scraper
  
  def self.scrape_our_products
    site = 'https://www.goodhousekeeping.com/food-products/g32366339/best-ice-cream-brands/'

    doc = Nokogiri::HTML(open(site))

    doc.css('div.listicle-slide.listicle-slide-square.listicle-slide-product').each do |info|
      name = info.css('span.listicle-slide-hed-text').text
      brand = info.css('span.product-slide-brand').text
      site = info.css('span.product-slide-vendor').text
      price = info.css('div.product-slide-price').text
      IceCream::BlueBellIceCream.new(name, brand, site, price.strip)
    end
  end
end
