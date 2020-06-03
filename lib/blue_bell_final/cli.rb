#Our CLI Controller, responsible for user interactions
class BlueBellFinal::CLI
  
  def call
    BlueBellFinal::Scraper.scrape_our_products
    welcome
    flavor_listings
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

  def flavor_listings
    input = gets.strip.downcase
    if input == "list"
      puts ""
      flavors = BlueBellFinal::BlueBellIceCream.all
      flavors.each.with_index(1) {|flavor, index| puts "#{index} #{flavor.name}"}
    elsif input == "exit"
      exit
    else
      puts ""
      puts "Please type 'list' to see our flavors, or 'exit' to exit the program."
      flavor_listings
    end
  end

  def menu
    puts ""
    puts "Please select the number of the flavor you wish to know more about! Otherwise, type 'exit' to leave the program."
    input = gets.strip

    if input.to_i > 0
      flavor_choice = BlueBellFinal::BlueBellIceCream.find_by_index(input.to_i - 1)
      puts ""
      puts "BLUE BELL FLAVORS RULE!"
      puts "Flavor Chosen: #{flavor_choice.name}"
      puts "Size: #{flavor_choice.size}"
      puts "Description: #{flavor_choice.description}"
      puts "Nutritional URL: #{flavor_choice.nutrition}"
    elsif input.downcase == "exit"
      exit
    else
      puts "Please try again."
      menu
    end
  end


end