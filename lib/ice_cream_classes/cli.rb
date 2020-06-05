class IceCream::CLI
  
  def call
    IceCream::Scraper.scrape_our_products
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
    puts "Welcome to the I SCREAM, YOU SCREAM, WE ALL SCREAM FOR ICE CREAM CLI!"
    puts ""
    puts "To see the top 10 flavors of ice cream type 'list'."
    puts "To end this program, type 'exit'."
    puts ""
  end

  def product_listings
    input = gets.strip.downcase
    if input == "list"
      puts ""
      puts "Here are the top 10 flavors:"
      products = IceCream::BlueBellIceCream.all
      products.each.with_index(1) {|products, index| puts "#{index} #{products.name}"}
    elsif input == "exit"
      exit
    else 
      puts ""
      puts "Please type 'list' to see the top 10 flavors of ice cream, or 'exit' to exit the program."
      product_listings
    end
  end

  def menu
    puts ""
    puts "Please select the number of the product you wish to know more about! Otherwise, type 'exit' to leave the program."
    input = gets.strip

    if input.to_i > 0 && input.to_i <= IceCream::BlueBellIceCream.all.length
      product_choice = IceCream::BlueBellIceCream.find_by_index(input.to_i - 1)
      puts ""
      puts "ICE CREAM RULES!!!"
      puts ""
      puts "   ( ~)"
      puts "   ( ~)"
      puts "   (~ )"
      puts "   \\~~/"
      puts "    \\/"
      puts ""
      puts "Flavor Chosen: #{product_choice.name}"
      puts "Brand Name: #{product_choice.brand}"
      puts "Website to purchase: #{product_choice.site}"
      puts "Price: #{product_choice.price}"
      puts ""
      menu
    elsif input.downcase == "exit"
      exit
    else
      puts "Please try again."
      menu
    end
  end

  def exit
    puts ""
    puts "Thank you for checking out the flavors! See you next time!"
  end

end