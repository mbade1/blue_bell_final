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
  end 

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number fo the deal you'd like more info on or type list to see the flavors again or type 'exit':"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on flavor 1"
      when "2"
        puts "More info on flavor 2"
      when "list"
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