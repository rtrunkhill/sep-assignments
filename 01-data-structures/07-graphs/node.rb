class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
    # @film_actor_hash = film_actor_hash
  
  def initialize(name)
      @name = name
      # @movies = [movies]
  end
  
  def film_actor_hash(movie, actors)
    @film_actor_hash = Hash.new
    @film_actor_hash[movie] = [actors]
    actors.delete(@name) if actors.include?(@name) #this isn't right
  end
end