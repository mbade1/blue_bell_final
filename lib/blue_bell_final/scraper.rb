require 'open-uri'
require 'nokogiri'


class BlueBellFinal::Scraper

  def self.scrape_our_products
    site = Nokogiri::HTML(open('https://www.bluebell.com/our-products/'))

    all = []

    product = site.css("div.products .description.tabs .description__wrapper .description__inner")
    product.each do |product_info|

      name = product_info.css(".description__aside h4.description__title").text
      size = "half gallon"
      description = product_info.css(".description__body .description__content h5").text
      nutrition = product_info.css(".description__aside ul.description__menu .nutrition_tabs .description__submenu .nutrition-item a.tab__trigger").attr("href").text

      product_hash = {:name => name, :size => size, :description => description, :nutrition => nutrition}
      all << product_hash
      end
    all
  end
end

  #scraper method - ##all flavors MUST scrape for:
    #name, size (half gallon), description, and url with nutrition info.
#source for all product_info:

#name = .description__aside h4.description__title
#size = .description__aside .description__menu li.nutrition_tabs .description__submenu a.tab__trigger 
#description =  .description__body .description__content h5
#nutrition = .description__aside ul.description__menu .nutrition_tabs .description__submenu .nutrition-item a.tab__trigger 