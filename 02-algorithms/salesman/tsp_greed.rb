require_relative 'city'

class Salesman
    attr_accessor :visited

    def initialize
        @visited = []
    end

    def shortest_path(start, f)
        current_city = start
        # @visited << current_city.city
        # @visited << current_city.city unless @visited.include?(current_city.city)
        @visited.include?(current_city.city) ? (return @visited) : @visited << current_city.city
        # @visited.length == 8 ? (return @visited) : @visited << current_city.city

        # return @visited if @visited.include?(start.city)
        # current_city = start
        # @visited << current_city.city
        p "***********************"
        # p "@visited: #{@visited}"
        
        for place in current_city.neighbors.keys do
            # p "place: #{place}"
            for child in current_city.neighbors[place]
                if shortest_path(child, f)
                    # @visited << place unless @visited.include? place
                    @visited.include?(place) ? @visited : @visited << place
                end
            end
        end
         p "@visited: #{@visited}"
        return @visited[0..f]
    end
end

