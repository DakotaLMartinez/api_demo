module ApiDemo
  class Restaurant 

    @@all = []

    def self.all 
      @@all
    end

    def self.find_by_number(number)
      self.all[number.to_i - 1]
    end

    def self.load_by_location(location)
      location_based_search_results = API.yelp_search("restaurant", location)
      @@all = self.create_from_search_results(location_based_search_results)
    end

    def self.create_from_search_results(search_results)
      search_results.map do |restaurant_info_hash|
        self.new(restaurant_info_hash)
      end
    end

    attr_accessor :id, :name, :review_count, :rating, :location, :price, :phone

    def initialize(attributes={})
      attributes.each do |attribute_name,attribute_value|
        if self.respond_to?("#{attribute_name}=")
          self.send("#{attribute_name}=", attribute_value)
        end
      end
    end
    

    def details 
      <<-HEREDOC

#{self.price} #{self.name} has #{self.review_count} reviews with an average rating of #{self.rating}
#{self.address}
#{self.phone}

      HEREDOC
    end

    def address
      location["display_address"].join("\n")
    end
  end
end