require_relative 'city'

class Salesman
    
    attr_accessor :visited

    def initialize
        @visited = []
        @cities =[]
    end

    def shortest_path(start)
        return @visited if @visted.include?(start.city)
        current_city = start
        @visted << current_city.city
        
        for neighbor in start.neighbors.values do
            current_city = neighbor unless @visted.include?(neighbor.city)
            break
            # shortest_path(current_city)
        end
        shortest_path(current_city)
    end
end

