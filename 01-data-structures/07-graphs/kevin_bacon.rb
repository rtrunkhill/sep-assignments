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

    def initialize(star)
        @star = star
    end
    
    def find_kevin_bacon(star)
        films = []
        return movie[0] if star == kevin_bacon
        if star != kevin_bacon
            films << movie[0]
            return films if movie[0].include?(kevin_bacon)
        else
            nextstar = film_actor_hash[0]
            find_kevin_bacon(nextstar)
        end
    end
end

thoughts:  
* set an array seperation
* if film_actor_hash != include kevin_bacon then seperation << film_actor_hash
* select first act