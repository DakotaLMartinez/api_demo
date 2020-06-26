module ApiDemo
  class API 
    def self.get_shows 
      response = HTTParty.get('http://api.tvmaze.com/shows')
      body = response.body
      JSON.parse(body)
    end
  end
end