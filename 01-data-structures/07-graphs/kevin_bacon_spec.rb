include RSpec

require_relative 'kevin_bacon'
require_relative 'node'

RSpec.describe KevinBacon, type: Class do
    # kevin_bacon.film_actor_hash['Footloose'] = [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker, …]
    
    let (:graph) { KevinBacon.new() }
    let (:kevin_bacon) { Node.new("Kevin Bacon") }
    let (:chuck) { Node.new("Chuck") }
    let (:paul) { Node.new("Paul") }
    let (:donald) { Node.new("Donald") }
    let (:hillary) { Node.new("Hillary") }
    # let (:barrack) { Node.new("Barrack") }
    # let (:bill) { Node.new("Bill") }
    # let (:mitch) { Node.new("Mitch") }
    # let (:nancy) { Node.new("Nancy") }
    # let (:michelle) {Node.new("Michelle") }
    before do
        kevin_bacon.film_actor_hash['Footloose'] = [donald, chuck]
        kevin_bacon.film_actor_hash['A Few Good Men'] = [hillary]
        chuck.film_actor_hash['Footloose'] = [kevin_bacon, donald]
        chuck.film_actor_hash['Glory'] = [donald]
        donald.film_actor_hash['Footloose'] = [chuck, kevin_bacon]
        donald.film_actor_hash['Glory'] = [chuck]
        donald.film_actor_hash['Bill and Teds'] = [paul]
        hillary.film_actor_hash['A Few Good Men'] = [kevin_bacon]
        hillary.film_actor_hash['Star Wars'] = [paul]
        paul.film_actor_hash['Star Wars'] = [hillary]
        paul.film_actor_hash['Bill and Teds'] = [donald]
    end
    # film_actor_hash['Footloose'] = [donald, kevin_bacon, chuck]
    # film_actor_hash['A Few Good Men'] =[hillary, kevin_bacon] 
    # film_actor_hash['Glory'] = [chuck, donald]
    # film_actor_hash['Bill and Teds'] = [paul, donald]
    # film_actor_hash['Star Wars'] = [paul, hillary]
    # film_actor_hash['Star Trek'] = [chuck, paul, michelle, hillary]
    # film_actor_hash['Die Hard'] = [bill, barrack, michelle]
    # film_actor_hash['A Christmas Story'] = [chuck, nancy, mitch]
    # film_actor_hash['Horton Hears a Who'] = [donald, barrack]
    # film_actor_hash['Dazed and Confused'] = [paul, donald, mitch]
    
    # "Kevin Bacon", ["Footloose", "A Few Good Men"]
    # "Chuck", ["Footloose", "Glory"]
    # "Paul", ["Star Wars", "Bill and Teds"]
    # "Donald", ["Footloose", "Glory", "Bill and Teds"]
    # "Hillary", ["Star Wars", "A Few Good Men"]
    # "Barrack", ["Bill and Teds", "Die Hard", "Horton Hears a Who"]
    # "Bill", ["A Few Good Men", "Bill and Teds", "Die Hard"]
    # "Mitch", ["A Few Good Men", "Bill and Teds", "A Christmas Story", "Dazed and Confused"]
    # "Nancy", ["Star Wars", "A Christmas Story"]
    # "Michelle" ["Star Trek", "Die Hard", "Glory"]
    



    describe "#find_kevin_bacon" do
        it "checks if start node == kevin_bacon" do
            graph.find_kevin_bacon(kevin_bacon)
            p "*****************"
            p "films: #{films}"
            expect(films).to eq ['Footloose']
        end
        
    #     # it "returns films array if start node != kevin_bacon"
    #     #     graph.find_kevin_bacon(paul)
    #     #     expect(films).to eq ["Star Wars", "A Christmas Story", "Footloose"]
    #     # end
        
    #     # it "goes to the first film in film_actor_hash and pushes that film into searched array"
    #     # end
        
    #     # it "ends the search if searhed array is > 6"
    #     # end
    end

end
