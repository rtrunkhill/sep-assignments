include RSpec

require_relative 'kevin_bacon'
require_relative 'node'

RSpec.describe KevinBacon, type: Class do
    
    let (:graph) { KevinBacon.new() }
    let (:kevin_bacon) { Node.new("Kevin Bacon") }
    let (:chuck) { Node.new("Chuck") }
    let (:paul) { Node.new("Paul") }
    let (:donald) { Node.new("Donald") }
    let (:hillary) { Node.new("Hillary") }
    let (:nobody) { Node.new("Nobody") }
    let (:anybody) { Node.new("Anybody")}

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



    describe "#find_kevin_bacon" do
        # it "checks if start node == kevin_bacon" do
        #     graph.find_kevin_bacon(kevin_bacon)
        #     p "*****************"
        #     # p "films: #{films}"
        #     expect(@films).to eq ['Footloose']
        # end
        
        it "checks directly connected actor" do
            graph.find_kevin_bacon(chuck)
            p "*****************"
            p "chuck films: #{graph.films}"
            expect(graph.films).to eq ['Footloose']
        end

        it "checks indirectly connected actor" do
            graph.find_kevin_bacon(paul)
            p "*****************"
            p "paul films: #{graph.films}"
            expect(graph.films).to eq ["A Few Good Men", "Star Wars"]
        end
        
        it "checks indirectly connected actor" do
            graph.find_kevin_bacon(hillary)
            p "*****************"
            p "hillary films: #{graph.films}"
            expect(graph.films).to eq ["A Few Good Men"]
        end
    end
end
