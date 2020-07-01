module ApiDemo
  class Restaurant 
    def self.load_by_location(location)
      API.yelp_search("restaurant", location)
    end
  end
end