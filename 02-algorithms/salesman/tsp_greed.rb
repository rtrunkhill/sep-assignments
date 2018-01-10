require_relative 'city'

class Salesman
    attr_accessor :visited

    def initialize
        @visited = []
    end

    def shortest_path(start)
        current_city = start
        @visited.include?(current_city.city) ? (return @visited) : @visited << current_city.city
        p "***********************"
        p "@visited: #{@visited}"
        
        for place in current_city.neighbors.keys do
            p "place: #{place}"
            for child in current_city.neighbors[place]
                if shortest_path(child)
                    @visited << place unless @visited.include? place
                end
            end
        end
    end
end

