require 'open-uri'
require 'nokogiri'
require 'pry'

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

# class BlueBellFinal::Scraper

#   def self.scrape_our_products
#     doc = Nokogiri::HTML(open('https://www.heb.com/category/shop/frozen-food/ice-cream-treats/ice-cream/490075/490300?N=2123328484+4294957066'))

#     doc.css("div.responsivegriditem-middle").each do |info|
#       name = info.css("span.responsivegriditem__title").text
#       price = info.css("span.cat-price-number").text
#       price_per_pack_or_oz = info.css("span.uomSalePrice").text
#       BlueBellFinal::BlueBellIceCream.new(name, price, price_per_pack_or_oz)
#       binding.pry
#     end
#   end
# end



#Original scraper method:     


  #scraper method - ##all flavors MUST scrape for:
    #name, size (half gallon), description, and url with nutrition info.
#source for all product_info:

#name = .description__aside h4.description__title
#size = .description__aside .description__menu li.nutrition_tabs .description__submenu a.tab__trigger 
#description =  .description__body .description__content h5
#nutrition = .description__aside ul.description__menu .nutrition_tabs .description__submenu .nutrition-item a.tab__trigger 




#OR, scrape for top 10 ice creams:

# def self.scrape_our_products
#   site = Nokogiri::HTML(open('https://www.goodhousekeeping.com/food-products/g32366339/best-ice-cream-brands/'))
#   #scrape for: name, brand, where to buy, price
#   product = site.css("div.listicle-slide.listicle-slide-square.listicle-slide-product")
#   product.each do |info|
#     name = info.css("span.listicle-slide-hed-text").text
#     brand = info.css("span.listicle-slide-hed-text").text
#     where_to_buy = info.css("span.product-slide-vendor").text
#     price = info.css("div.product-slide-price").text
#     BlueBellFinal::BlueBellIceCream.new(name, brand, where_to_buy, price)
#   end
# end

#   product = site.css("div.products .description.tabs .description__wrapper .description__inner").each do |product_info|

#     name = product_info.css(".description__aside h4.description__title").text
  
  
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