#Our CLI Controller, responsible for user interactions
class BlueBellFinal::CLI
  
  def call
    list_flavors
    menu
    goodbye
  end

  def list_flavors
    puts "Look at all of our flavors!"
    
    @flavors = BlueBellFinal::BlueBellIceCream.all
    @flavors.each.with_index(1) do |flavor, index|
      puts "#{index}. #{flavor.name}"
    end
  end 

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number for the deal you'd like more info on or type list to see the flavors again or type 'exit':"
      input = gets.strip.downcase
      if input.to_i > 0
        the_flavor = @flavors[input.to_i-1]
        puts "#{the_flavor.name}"
      elsif input == "list"
        list_flavors
      else
        puts "Not sure what you want, type 'list' or 'exit'."
      end
    end
  end
  
  def goodbye
    puts "See you tomorrow for more flavors!"
  end

end