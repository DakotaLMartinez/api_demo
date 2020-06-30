module ApiDemo
  class CLI 
    def start 
      puts "Welcome to our demo API"
      list_shows
    end

    def list_shows
      Tvshow.load
      Tvshow.all.each.with_index(1) do |show, index|
        puts "#{index}. #{show.name}"
      end
    end
  end
end