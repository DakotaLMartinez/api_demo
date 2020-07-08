module ApiDemo
  class CLI 
    def initialize
      @input = ""
    end

    def start 
      puts "Welcome to our Yelp Restaurant Searcher CLI!"
      while @input != "exit"
        set_location
        start_restaurant_picker
      end
      goodbye
    end

    def set_location 
      puts "So we can figure out where you wanna eat tonight, where are you?"
      @location = gets.chomp
      Restaurant.load_by_location(@location)
    end

    def start_restaurant_picker
      list_restaurants
      ask_for_choice
      while @input != "exit" && @input != "back"
        binding.pry if @input == "debug"
        if @input == "list"
          list_restaurants
        elsif valid?
          puts Restaurant.find_by_number(@input).details
        else
          puts "Whoops! I didn't get that. Try again?"
        end
        ask_for_choice
      end
    end
  
    def list_restaurants 
      Restaurant.all.each.with_index(1) do |restaurant, index|
        puts "#{index}. #{restaurant.name}"
      end
    end

    def ask_for_choice
      list_choices
      @input = gets.strip.downcase
    end

    def list_choices 
      puts [
        "To see more information about a restaurant, type it's number and hit enter",
        "If you'd like to view the list again, type 'list'",
        "If you'd like to return to the main menu and do another search, type 'back'",
        "If you'd like to exit the program, simply type 'exit'"
      ]
    end

    def valid?
      @input.to_i.between?(1, Restaurant.all.length)
    end

    def goodbye
      puts "\nThanks for using our Restuarant finder CLI! Bon Apetit!"
    end
  end
end