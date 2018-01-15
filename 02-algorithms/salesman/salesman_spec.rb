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
    let (:boise) { City.new("Boise") }

    before do
        seattle.neighbors['Seattle'] = [portland, boise]
        portland.neighbors['Portland'] = [seattle, boise, san_fransico]
        boise.neighbors['Boise'] = [seattle, portland, salt_lake]
        san_fransico.neighbors['San Fransico'] = [los_angeles, portland]
        los_angeles.neighbors['LA'] = [san_fransico, las_vegas, phoenix]
        phoenix.neighbors['Phoenix'] = [los_angeles, las_vegas]
        las_vegas.neighbors['Vegas'] = [phoenix, los_angeles, salt_lake]
        salt_lake.neighbors['SLC"'] = [las_vegas, boise]
    end




    describe "#finds the proper path" do
        it "checks if start City == seattle" do
            expect(search.shortest_path(seattle, 7)).to eq ['Seattle', 'Portland', 'Boise', 'SLC', 'Vegas', 'Phoenix', 'LA', 'San Fransico']
        end
    end
end