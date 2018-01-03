include RSpec

require_relative 'binary_heap2'

RSpec.describe BinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:heap) { BinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  
  describe "#initialize" do
    it "sets @root to passed node" do
      heap = BinaryHeap.new(root)
    end
  end
  
  describe "#insert" do
    it "replaces the root if lower rating" do
      heap.insert(jedi)
      expect(heap.items[0]).to eq jedi
    end

    it "adds items properly" do
      heap.insert(pacific_rim)
      heap.insert(mad_max_2)
      heap.insert(braveheart)
      heap.insert(empire)
      heap.insert(jedi)
      heap.insert(hope)
      heap.insert(donnie)
      heap.insert(inception)
      heap.insert(district)
      heap.insert(shawshank)
      heap.insert(martian)
      expect(heap.items[0]).to eq pacific_rim
      expect(heap.items[1]).to eq braveheart
      expect(heap.items[2]).to eq jedi
      expect(heap.items[3]).to eq donnie
      expect(heap.items[4]).to eq inception
      expect(heap.items[heap.items.size - 2]).to eq empire
      expect(heap.items[heap.items.size - 1]).to eq mad_max_2
    end
  end

  describe "#find" do
    it "returns nil if not added" do
      heap.insert(pacific_rim)
      heap.insert(braveheart)
      heap.insert(inception)
      expect(heap.find("District 9")).to be_nil
    end

    it "returns correct node if added" do
      heap.insert(hope)
      heap.insert(jedi)
      heap.insert(empire)
      expect(heap.find("Star Wars: A New Hope")).to eq hope
    end
  end


  describe "#delete" do
    it "deletes correct node" do
      heap.insert(inception)
      expect(heap.items[0]).to eq inception
      heap.delete("Inception")
      expect(heap.items[0]).to eq root

      heap.insert(pacific_rim)
      heap.delete("The Matrix")
      expect(heap.items[0]).to eq pacific_rim
    end

    it "reorganizes correctly" do
      heap.insert(jedi)
      heap.insert(empire)
      heap.insert(hope)
      heap.insert(martian)
      heap.insert(braveheart)
      expect(heap.items[1]).to eq jedi

      heap.delete("The Matrix")
      expect(heap.find("The Matrix")).to be_nil
      expect(heap.items[2]).to eq martian
      # expect(heap.items[heap.left(1)]).to eq hope
      # expect(heap.items[heap.right(1)]).to eq empire

      heap.delete("Star Wars: Return of the Jedi")
      expect(heap.items[2]).to eq hope
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nInception: 86\nThe Matrix: 87\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
       heap.insert(hope)
       heap.insert(empire)
       heap.insert(jedi)
       heap.insert(martian)
       heap.insert(pacific_rim)
       heap.insert(inception)
       heap.insert(braveheart)
       heap.insert(shawshank)
       heap.insert(district)
       heap.insert(mad_max_2)
       expect { heap.printf }.to output(expected_output).to_stdout
     }
  end
end
