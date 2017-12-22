require_relative 'node'

# Kevin_Bacon.film_actor_hash['Footloose'] = [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker, …]

# DEF FIND_PATH(Node start, Node end)
#   IF start is equal to end THEN
#     RETURN end
#   END IF
#   FOR each node that start connects to
#     IF the node is closer to end than start THEN
#       RETURN start + CALL FIND_PATH(node, end)
#     END IF
#   END FOR
# END DEF

class KevinBacon

    def find_kevin_bacon(star)
        films = []
        if films.length > 6
            return "No Bacon here!"
        else
            star.film_actor_hash.each do |movie, actors|
                films << movie
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