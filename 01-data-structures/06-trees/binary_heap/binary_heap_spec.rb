include RSpec

require_relative 'binary_heap'

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

  
  describe "#insert(data)" do
    it "properly inserts a new node and exchange with root if needed" do
      heap.insert(heap.root, pacific_rim)
      expect(heap.root.title).to eq "Pacific Rim"
      expect(heap.root.left.title).to eq "The Matrix"
    end
    
    it "properly inserts a new node as a right child" do
      heap.insert(heap.root, pacific_rim)
      heap.insert(heap.root, braveheart)
      expect(heap.root.title).to eq "Pacific Rim"
      expect(heap.root.left.title).to eq "The Matrix"
      expect(heap.root.right.title).to eq "Braveheart"
    end
    
    it "properly inserts a new node as a left-left child and exchange as needed" do
      heap.insert(heap.root, pacific_rim)
      heap.insert(heap.root, braveheart)
      heap.insert(heap.root, jedi)
      expect(heap.root.right.title).to eq "Braveheart"
      expect(heap.root.left.title).to eq "Star Wars: Return of the Jedi"
      expect(heap.root.left.left.title).to eq "The Matrix"
    end
    
    it "properly inserts a new node as a left.right child and exchange as needed" do
      heap.insert(heap.root, pacific_rim)
      heap.insert(heap.root, braveheart)
      heap.insert(heap.root, jedi)
      heap.insert(heap.root, donnie)
      expect(heap.root.left.right.title).to eq "Donnie Darko"
    end
    
    it "properly inserts a new node as a right.left child and exchange as needed" do
      heap.insert(heap.root, pacific_rim)
      heap.insert(heap.root, braveheart)
      heap.insert(heap.root, jedi)
      heap.insert(heap.root, donnie)
      # p "printf #1: #{heap.printf}"
      heap.insert(heap.root, inception)
      p "@root: #{@root}"
      p "root.left.title: #{heap.root.left.title}"
      p "printf #2: #{heap.printf}"
      expect(heap.root.right.left.title).to eq "Inception"
    end

    
  end

  # describe "#find(data)" do
  #   it "handles nil gracefully" do
  #     heap.insert(root, empire)
  #     heap.insert(root, mad_max_2)
  #     expect(heap.find(root, nil)).to eq nil
  #   end

  #   it "properly finds a left node" do
  #     heap.insert(root, pacific_rim)
  #     expect(heap.find(root, root.title).title).to eq "The Matrix"
  #   end

  #   it "properly finds a left-left node" do
  #     heap.insert(heap.root, pacific_rim)
  #     heap.insert(heap.root, braveheart)
  #     heap.insert(heap.root, jedi)
  #     expect(heap.find(root, root.title).title).to eq "The Matrix"
  #   end

  #   it "properly finds a right node" do
  #     heap.insert(heap.root, pacific_rim)
  #     heap.insert(heap.root, braveheart)
  #     expect(heap.find(heap.root, braveheart.title).title).to eq "Braveheart"
  #   end
  # end

  # describe "#delete(data)" do
  #   it "handles nil gracefully" do
  #     expect(heap.delete(root, nil)).to eq nil
  #   end

  #   it "properly deletes a left node" do
  #     heap.insert(root, hope)
  #     heap.delete(root, hope.title)
  #     expect(heap.find(root, hope.title)).to be_nil
  #   end

  #   it "properly deletes a left-left node" do
  #     heap.insert(root, braveheart)
  #     heap.insert(root, pacific_rim)
  #     heap.delete(root, pacific_rim.title)
  #     expect(heap.find(root, pacific_rim.title)).to be_nil
  #   end

  #   it "properly deletes a left-right node" do
  #     heap.insert(root, donnie)
  #     heap.insert(root, inception)
  #     heap.delete(root, inception.title)
  #     expect(heap.find(root, inception.title)).to be_nil
  #   end

  #   it "properly deletes a right node" do
  #     heap.insert(root, district)
  #     heap.delete(root, district.title)
  #     expect(heap.find(root, district.title)).to be_nil
  #   end

  #   it "properly deletes a right-left node" do
  #     heap.insert(root, hope)
  #     heap.insert(root, martian)
  #     heap.delete(root, martian.title)
  #     expect(heap.find(root, martian.title)).to be_nil
  #   end

  #   it "properly deletes a right-right node" do
  #     heap.insert(root, empire)
  #     heap.insert(root, mad_max_2)
  #     heap.delete(root, mad_max_2.title)
  #     expect(heap.find(root, mad_max_2.title)).to be_nil
  #   end
  # end

  # describe "#printf" do
  # p "*********************************"
  # p "RSPEC printf"
  #   specify {
      # expected_output = "The Matrix: 87\nStar Wars: Return of the Jedi: 80\nStar Wars: A New Hope: 93\nPacific Rim: 72\nInception: 86\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nBraveheart: 78\nThe Shawshank Redemption: 91\nMad Max 2: The Road Warrior: 98\nDistrict 9: 90\n"
      # heap.insert(heap.root, hope)
      # heap.insert(heap.root, empire)
      # heap.insert(heap.root, jedi)
      # heap.insert(heap.root, martian)
      # heap.insert(heap.root, pacific_rim)
      # heap.insert(heap.root, inception)
      # p "printf: #{heap.printf}"
      # p "root.left.left.title: #{heap.root.left.left.title}"
      # p "root.left.right.title: #{heap.root.left.right.title}"
      # p "root.right.right.title: #{heap.root.right.left.title}"
      # heap.insert(heap.root, braveheart)
      # p "printf: #{heap.printf}"
      # p "root.left.left.title: #{heap.root.left.left.title}"
      # heap.insert(heap.root, shawshank)
      # heap.insert(heap.root, district)
      # heap.insert(heap.root, mad_max_2)
      # p "printf: #{heap.printf}"
      # expect { heap.printf }.to output(expected_output).to_stdout
    # }

  #   specify {
  #     expected_output = "The Matrix: 87\nBraveheart: 78\nMad Max 2: The Road Warrior: 98\nPacific Rim: 72\nInception: 86\nDistrict 9: 90\nStar Wars: Return of the Jedi: 80\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
  #     heap.insert(root, mad_max_2)
  #     heap.insert(root, district)
  #     heap.insert(root, shawshank)
  #     heap.insert(root, braveheart)
  #     heap.insert(root, inception)
  #     heap.insert(root, pacific_rim)
  #     heap.insert(root, martian)
  #     heap.insert(root, jedi)
  #     heap.insert(root, empire)
  #     heap.insert(root, hope)
  #     expect { heap.printf }.to output(expected_output).to_stdout
  #   }
  # end
end
