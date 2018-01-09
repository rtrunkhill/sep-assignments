include RSpec

require_relative 'tsp_greed'
require_relative 'city'

RSpec.describe Salesman, type: Class do
    
    let (:search) { Salesman.new() }
    let (:seattle) { City.new("Seattle") }
    let (:san_fransico) { City.new("San Fransico") }
    let (:los_angeles) { City.new("LA") } 
    let (:phoenix) { City.new("Phoenix") }
    let (:las_vegas) { City.new("Vegas") }
    let (:salt_lake) { City.new("SLC") }
    let (:portland) { City.new("Portland")}
    let (:boise) { City.new("Boise")

    before do
        seattle.neighbors['Seattle'] = [portland, boise]
        portland.neighbors['Portland'] = [seattle, boise, san_fransico]
        boise.neighbors['Boise'] = [seattle, portland, salt_lake]
        san_fransico.neighbors['San Fransico'] = [los_angeles, portland]
        los_angeles.neighbors['LA'] = [san_fransico, las_vegas, phoenix]
        phoenix.neighbors['Phoenix'] = [los_angeles, las_vegas]
        las_vegas.neighbors['Vegas'] = [los_angeles, phoenix, salt_lake]
        salt_lake.neighbors['SLC"'] = [las_vegas, boise]
    end




    describe "#finds the proper path" do
        it "checks if start City == seattle" do
            expect(search.vistied[0]).to eq ['Seattle']
        end
        
    #     it "checks directly connected actor" do
    #         graph.find_kevin_bacon(chuck)
    #         p "*****************"
    #         p "chuck films: #{graph.films}"
    #         expect(graph.films).to eq ['Footloose']
    #     end

    #     it "checks indirectly connected actor" do
    #         graph.find_kevin_bacon(paul)
    #         p "*****************"
    #         p "paul films: #{graph.films}"
    #         expect(graph.films).to eq ["A Few Good Men", "Star Wars"]
    #     end
        
    #     it "checks indirectly connected actor" do
    #         graph.find_kevin_bacon(hillary)
    #         p "*****************"
    #         p "hillary films: #{graph.films}"
    #         expect(graph.films).to eq ["A Few Good Men"]
    #     end
    end
end