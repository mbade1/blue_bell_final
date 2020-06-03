require 'open-uri'
require 'nokogiri'
require 'pry'


class BlueBellFinal::Scraper

  def self.scrape_our_products
    doc = Nokogiri::HTML(open('https://www.bluebell.com/our-products/'))

    doc.css("div.responsivegriditem-middle").each do |info|
      name = info.css("span.responsivegriditem__title").text
      price = info.css("span.cat-price-number").text
      price_per_pack_or_oz = info.css("span.uomSalePrice").text
      # BlueBellFinal::BlueBellIceCream.new(name, price, price_per_pack_or_oz)
      binding.pry
    end
  end
end



#Original scraper method:     
# def self.scrape_our_products
#   site = Nokogiri::HTML(open('https://www.bluebell.com/our-products/'))

#   product = site.css("div.products .description.tabs .description__wrapper .description__inner").each do |product_info|

#     name = product_info.css(".description__aside h4.description__title").text
#     size = "half gallon"
#     description = product_info.css(".description__body .description__content.current.description__text h5").text
#     nutrition = product_info.css(".description__aside ul.description__menu .nutrition_tabs .description__submenu .nutrition-item a.tab__trigger").attr("href").text
#     BlueBellFinal::BlueBellIceCream.new(name, size, description, nutrition)
#     binding.pry
#     end
# end

  #scraper method - ##all flavors MUST scrape for:
    #name, size (half gallon), description, and url with nutrition info.
#source for all product_info:

#name = .description__aside h4.description__title
#size = .description__aside .description__menu li.nutrition_tabs .description__submenu a.tab__trigger 
#description =  .description__body .description__content h5
#nutrition = .description__aside ul.description__menu .nutrition_tabs .description__submenu .nutrition-item a.tab__trigger 