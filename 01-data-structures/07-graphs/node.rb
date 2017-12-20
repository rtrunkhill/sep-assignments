class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
    # @film_actor_hash = film_actor_hash
  
  def initialize(name, movies)
      @name = name
      @movies = [movies]
  end
  
  def movie_actors(movie, actors)
    @film_actor_hash = Hash.new
    @film_actor_hash[movie] = [actors]
  end
end