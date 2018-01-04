require_relative 'node'

class KevinBacon

    def find_kevin_bacon(star)
        @films = []
        return "No Bacon for #{star}!" if @films.length > 6
        # p "films: #{films}"
        
        star.film_actor_hash.each do |movie, actors|
            @films << movie unless @films.include?(movie)
            # return @films if star.name == "Kevin Bacon"
            p "films: #{@films}"
            actors.each do |hero|
                p "hero: #{hero.name}"
                hero.name == "Kevin Bacon" ? (return @films) : find_kevin_bacon(hero)
            end
        end
        # films.length <= 6 && films.length > 0 ? (return films) : (return "No Bacon for #{star}!") 
    end
end

# thoughts:  
# * set an array seperation
# * if film_actor_hash != include kevin_bacon then seperation << film_actor_hash
# * select first act