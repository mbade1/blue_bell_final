#Our CLI Controller, responsible for user interactions
class BlueBellFinal::CLI
  
  def call
    BlueBellFinal::Scraper.scrape_our_products
    welcome
    product_listings
    menu
  end

  def welcome
    puts ""
    puts "\|/          (__)"    
    puts "     `\------(oo)"
    puts "       ||   (__)"
    puts "       ||w--||     \|/"
    puts "   \|/"
    puts ""
    puts "Welcome to the Blue Bell Ice Cream Flavor CLI!"
    puts ""
    puts "To see all the great flavors of Blue Bell Ice Cream that HEB offers, type 'list'."
    puts "To end this program, type 'exit'."
    puts ""
  end

  def product_listings
    input = gets.strip.downcase
    if input == "list"
      puts ""
      #lines 31-32 are the issue. Not collecting new instances of the BlueBellIceCream.all class method.
      products = BlueBellFinal::BlueBellIceCream.all
      products.each.with_index(1) {|products, index| puts "#{index} #{products.name}"}
    elsif input == "exit"
      exit
    else
      puts ""
      puts "Please type 'list' to see our products, or 'exit' to exit the program."
      flavor_listings
    end
  end

  def menu
    puts ""
    puts "Please select the number of the product you wish to know more about! Otherwise, type 'exit' to leave the program."
    input = gets.strip

    if input.to_i > 0
      product_choice = BlueBellFinal::BlueBellIceCream.find_by_index(input.to_i - 1)
      puts ""
      puts "BLUE BELL FLAVORS RULE!"
      puts "Flavor Chosen: #{product_choice.name}"
      puts "Price: #{product_choice.price}"
      puts "Price per ounce: #{product_choice.price_per_pack_or_oz}"
    elsif input.downcase == "exit"
      exit
    else
      puts "Please try again."
      menu
    end
  end
end