module ApiDemo
  class CLI 
    def start 
      puts "Welcome to our demo API"
      Tvshow.load
      Tvshow.all.each do |show|
        puts show.name
      end
    end
  end
end