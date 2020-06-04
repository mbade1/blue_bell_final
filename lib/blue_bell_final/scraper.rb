require 'open-uri'
require 'nokogiri'

class BlueBellFinal::Scraper
  
  def self.scrape_our_products
    site = 'https://www.goodhousekeeping.com/food-products/g32366339/best-ice-cream-brands/'

    doc = Nokogiri::HTML(open(site))

    doc.css('div.listicle-slide.listicle-slide-square.listicle-slide-product').each do |info|
      name = info.css('span.listicle-slide-hed-text').text
      brand = info.css('span.product-slide-brand').text
      site = info.css('span.product-slide-vendor').text
      price = info.css('div.product-slide-price').text
      BlueBellFinal::BlueBellIceCream.new(name, brand, site, price.strip)
    end
  end
end







#Blue Bell Site Scrapper method information:     

  #scraper method - ##all flavors MUST scrape for:
    #name, size (half gallon), description, and url with nutrition info.
#source for all product_info:

#name = .description__aside h4.description__title
#size = .description__aside .description__menu li.nutrition_tabs .description__submenu a.tab__trigger 
#description =  .description__body .description__content h5
#nutrition = .description__aside ul.description__menu .nutrition_tabs .description__submenu .nutrition-item a.tab__trigger 

  #ORIGINAL:
  
  # site = Nokogiri::HTML(open('https://www.bluebell.com/our-products/'))

  #   product = site.css("div.products .description.tabs .description__wrapper .description__inner").each do |product_info|

  #     name = product_info.css(".description__aside h4.description__title").text
  #     size = "half gallon"
  #     description = product_info.css(".description__body .description__content.current.description__text h5").text
  #     nutrition = product_info.css(".description__aside ul.description__menu .nutrition_tabs .description__submenu .nutrition-item a.tab__trigger").attr("href").text
  #     BlueBellFinal::BlueBellIceCream.new(name, size, description, nutrition)
  #     binding.pry
  #   end