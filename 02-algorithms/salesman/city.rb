class City
    attr_accessor :city
    attr_accessor :neighbors
    
    def initialize(city)
        @city = city
        @neighbors = Hash.new
    end
end