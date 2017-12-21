include RSpec

require_relative 'kevin_bacon'
require_relative 'node'

RSpec.describe KevinBacon, type: Class do
    # Kevin_Bacon.film_actor_hash['Footloose'] = [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker, …]
    let (:graph) { KevinBacon.new(star))
    let (:kevin_bacon) { Node.new("Kevin Bacon") }
    let (:chuck) { Node.new("Chuck") }
    let (:paul) { Node.new("Paul") }
    let (:donald) { Node.new("Donald") }
    let (:hillary) { Node.new("Hillary") }
    let (:barrack) { Node.new("Barrack") }
    let (:bill) { Node.new("Bill") }
    let (:mitch) { Node.new("Mitch") }
    let (:nancy) { Node.new("Nancy") }
    let (:michelle) {Node.new("Michelle") }
  
  
    # film_actor_hash['Footloose'] = [chuck, donald, kevin_bacon]
    # film_actor_hash['A Few Good Men'] =[bill, nancy, mitch, kevin_bacon] 
    # film_actor_hash['Glory'] = [michelle, chuck, donald]
    # film_actor_hash['Bill and Teds'] = [barrack, bill, mitch]
    # film_actor_hash['Star Wars'] = [nancy, paul, hillary]
    # film_actor_hash['Star Trek'] = [chuck, paul, michelle, hillary]
    # film_actor_hash['Die Hard'] = [bill, barrack, michelle]
    # film_actor_hash['A Christmas Story'] = [chuck, nancy, mitch]
    # film_actor_hash['Horton Hears a Who'] = [donald, barrack]
    # film_actor_hash['Dazed and Confused'] = [paul, donald, mitch]
    
    "Kevin Bacon", ["Footloose", "A Few Good Men"]
    "Chuck", ["Footloose", "Glory", "A Christmas Story"]
    "Paul", ["Star Wars", "Star Trek", "Dazed and Confused"]
    "Donald", ["Footloose", "Glory", "Horton Hears a Who", "Dazed and Confused"]
    "Hillary", ["Star Wars", "Star Trek"]
    "Barrack", ["Bill and Teds", "Die Hard", "Horton Hears a Who"]
    "Bill", ["A Few Good Men", "Bill and Teds", "Die Hard"]
    "Mitch", ["A Few Good Men", "Bill and Teds", "A Christmas Story", "Dazed and Confused"]
    "Nancy", ["Star Wars", "A Christmas Story"]
    "Michelle" ["Star Trek", "Die Hard", "Glory"]
    
    movie_actors('Footloose',[chuck, donald, kevin_bacon])


  

    describe "#find_kevin_bacon" do
        it "checks if start node == kevin_bacon" do
            graph.find_kevin_bacon(kevin_bacon)
            expect(films.last).to eq "Footloose"
        end
        
        it "returns films array if start node != kevin_bacon"
            graph.find_kevin_bacon(paul)
            expect(films).to eq ["Star Wars", "A Christmas Story", "Footloose"]
        end
        
        it "goes to the first film in film_actor_hash and pushes that film into searched array"
        end
        
        it "ends the search if searhed array is > 6"
        end
    end

end
