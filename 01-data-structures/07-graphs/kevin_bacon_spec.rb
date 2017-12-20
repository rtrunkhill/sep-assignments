include RSpec

require_relative 'kevin_bacon'
require_relative 'node'

RSpec.describe KevinBacon, type: Class do
    # Kevin_Bacon.film_actor_hash['Footloose'] = [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker, …]
    
    let (:kevin_bacon) { Node.new("Kevin Bacon", ["Footloose", "A Few Good Men"]) }
    let (:chuck) { Node.new("Chuck", ["Footloose", "Glory", "A Christmas Story"]) }
    let (:paul) { Node.new("Paul", ["Star Wars", "Star Trek", "Dazed and Confused"]) }
    let (:donald) { Node.new("Donald", ["Footloose", "Glory", "Horton Hears a Who", "Dazed and Confused"]) }
    let (:hillary) { Node.new("Hillary", ["Star Wars", "Star Trek"]) }
    let (:barrack) { Node.new("Barrack", ["Bill and Teds", "Die Hard", "Horton Hears a Who"]) }
    let (:bill) { Node.new("Bill", ["A Few Good Men", "Bill and Teds", "Die Hard"]) }
    let (:mitch) { Node.new("Mitch", ["A Few Good Men", "Bill and Teds", "A Christmas Story", "Dazed and Confused"]) }
    let (:nancy) { Node.new("Nancy", ["Star Wars", "A Chistmas Story"]) }
    let (:michelle) {Node.new("Michelle" ["Star Trek", "Die Hard", "Glory"]) }
  
  
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
    
    movie_actors('Footloose',[chuck, donald, kevin_bacon])


  

#   describe "#insert(data)" do
#     it "properly inserts a new node as a left child" do
#       p "**************************"
#       p "RSPEC Inserts new as left"
#       tree.insert(root, pacific_rim)
#       expect(root.left.title).to eq "Pacific Rim"
#     end

#     it "properly inserts a new node as a left-left child" do
#       tree.insert(root, braveheart)
#       tree.insert(root, pacific_rim)
#       expect(root.left.left.title).to eq "Pacific Rim"
#     end

#     it "properly inserts a new node as a left-right child" do
#       tree.insert(root, donnie)
#       tree.insert(root, inception)
#       expect(root.left.right.title).to eq "Inception"
#     end

#     it "properly inserts a new node as a right child" do
#       tree.insert(root, district)
#       expect(root.right.title).to eq "District 9"
#     end

#     it "properly inserts a new node as a right-left child" do
#       tree.insert(root, hope)
#       tree.insert(root, martian)
#       expect(root.right.left.title).to eq "The Martian"
#     end

#     it "properly inserts a new node as a right-right child" do
#       tree.insert(root, empire)
#       tree.insert(root, mad_max_2)
#       expect(root.right.right.title).to eq "Mad Max 2: The Road Warrior"
#     end
#   end

#   describe "#find(data)" do
#     p "*************************************"
#     p "RSPEC #find(data)"
#     it "handles nil gracefully" do
#       tree.insert(root, empire)
#       tree.insert(root, mad_max_2)
#       expect(tree.find(root, nil)).to eq nil
#     end

#     it "properly finds a left node" do
#       tree.insert(root, pacific_rim)
#       expect(tree.find(root, pacific_rim.title).title).to eq "Pacific Rim"
#     end

#     it "properly finds a left-left node" do
#       tree.insert(root, braveheart)
#       tree.insert(root, pacific_rim)
#       expect(tree.find(root, pacific_rim.title).title).to eq "Pacific Rim"
#     end

#     it "properly finds a left-right node" do
#       tree.insert(root, donnie)
#       tree.insert(root, inception)
#       expect(tree.find(root, inception.title).title).to eq "Inception"
#     end

#     it "properly finds a right node" do
#       tree.insert(root, district)
#       expect(tree.find(root, district.title).title).to eq "District 9"
#     end

#     it "properly finds a right-left node" do
#       tree.insert(root, hope)
#       tree.insert(root, martian)
#       expect(tree.find(root, martian.title).title).to eq "The Martian"
#     end

#     it "properly finds a right-right node" do
#       tree.insert(root, empire)
#       tree.insert(root, mad_max_2)
#       expect(tree.find(root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
#     end
#   end

#   describe "#delete(data)" do
#   p "*********************************************"
#   p "RSPEC detele(data)"
#     it "handles nil gracefully" do
#       expect(tree.delete(root, nil)).to eq nil
#     end

#     it "properly deletes a left node" do
#       tree.insert(root, hope)
#       tree.delete(root, hope.title)
#       expect(tree.find(root, hope.title)).to be_nil
#     end

#     it "properly deletes a left-left node" do
#       tree.insert(root, braveheart)
#       tree.insert(root, pacific_rim)
#       tree.delete(root, pacific_rim.title)
#       expect(tree.find(root, pacific_rim.title)).to be_nil
#     end

#     it "properly deletes a left-right node" do
#       tree.insert(root, donnie)
#       tree.insert(root, inception)
#       tree.delete(root, inception.title)
#       expect(tree.find(root, inception.title)).to be_nil
#     end

#     it "properly deletes a right node" do
#       tree.insert(root, district)
#       tree.delete(root, district.title)
#       expect(tree.find(root, district.title)).to be_nil
#     end

#     it "properly deletes a right-left node" do
#       tree.insert(root, hope)
#       tree.insert(root, martian)
#       tree.delete(root, martian.title)
#       expect(tree.find(root, martian.title)).to be_nil
#     end

#     it "properly deletes a right-right node" do
#       tree.insert(root, empire)
#       tree.insert(root, mad_max_2)
#       tree.delete(root, mad_max_2.title)
#       expect(tree.find(root, mad_max_2.title)).to be_nil
#     end
#   end

#   describe "#printf" do
#   p "*********************************"
#   p "RSPEC printf"
#     specify {
#       expected_output = "The Matrix: 87\nStar Wars: Return of the Jedi: 80\nStar Wars: A New Hope: 93\nPacific Rim: 72\nInception: 86\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nBraveheart: 78\nThe Shawshank Redemption: 91\nMad Max 2: The Road Warrior: 98\nDistrict 9: 90\n"
#       tree.insert(root, hope)
#       tree.insert(root, empire)
#       tree.insert(root, jedi)
#       tree.insert(root, martian)
#       tree.insert(root, pacific_rim)
#       tree.insert(root, inception)
#       tree.insert(root, braveheart)
#       tree.insert(root, shawshank)
#       tree.insert(root, district)
#       tree.insert(root, mad_max_2)
#       expect { tree.printf }.to output(expected_output).to_stdout
#     }

#     specify {
#       expected_output = "The Matrix: 87\nBraveheart: 78\nMad Max 2: The Road Warrior: 98\nPacific Rim: 72\nInception: 86\nDistrict 9: 90\nStar Wars: Return of the Jedi: 80\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
#       tree.insert(root, mad_max_2)
#       tree.insert(root, district)
#       tree.insert(root, shawshank)
#       tree.insert(root, braveheart)
#       tree.insert(root, inception)
#       tree.insert(root, pacific_rim)
#       tree.insert(root, martian)
#       tree.insert(root, jedi)
#       tree.insert(root, empire)
#       tree.insert(root, hope)
#       expect { tree.printf }.to output(expected_output).to_stdout
#     }
#   end
end
