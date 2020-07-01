module ApiDemo
  class CLI 
    def start 
      puts "Welcome to our Yelp Restaurant Searcher CLI!"
      puts "So we can figure out where you wanna eat tonight, where are you?"
      @location = gets.chomp
      
      Restaurant.load_by_location(@location)
    end
  
    def list_shows
      Tvshow.load
      Tvshow.all.each.with_index(1) do |show, index|
        puts "#{index}. #{show.name}"
      end
    end
  end
end