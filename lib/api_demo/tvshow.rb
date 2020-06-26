module ApiDemo
  class Tvshow
    @@all = []
    def self.load 
      @@all = API.get_shows.map do |show_attributes|
        self.new(show_attributes)
      end
    end

    def self.all 
      @@all
    end
    attr_accessor :name, :genres, :runtime, :summary
    def initialize(attributes)
      attributes.each do |attribute_name, attribute_value|
        self.send("#{attribute_name}=", attribute_value) if self.respond_to?("#{attribute_name}=")
      end
    end
  end
end