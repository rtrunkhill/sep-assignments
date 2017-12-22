require_relative 'node'

class KevinBacon

    def find_kevin_bacon(star)
        films = []
        if films.length > 6
            return "No Bacon here!"
        else
            star.film_actor_hash.each do |movie, actors|
                films << movie unless films.include?(movie)
                actors.each do |hero|
                    hero == kevin_bacon ? (return films) : find_kevin_bacon(hero)
                end
            end
        end
        # films.length <= 6 ? (return films) : (return "No Bacon for #{star}!") 
    end
end

# thoughts:  
# * set an array seperation
# * if film_actor_hash != include kevin_bacon then seperation << film_actor_hash
# * select first act