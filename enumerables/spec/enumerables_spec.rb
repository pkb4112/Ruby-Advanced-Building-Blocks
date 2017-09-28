require "enumerables"

describe "Enumerable" do
  describe ".my_map" do

    let(:testarray) {[1,2,3,4,5]}
    let(:testproc) {Proc.new {|x| x+1}}

    context "Given an array and a block" do
      it "Will return a new array modified by the block" do
        expect(testarray.my_map(&testproc)).to eql([2,3,4,5,6])
      end
    end

    let(:testarray2) {[]}

    context "Given an empty array and a block" do
      it "Will return an empty array" do
        expect(testarray2.my_map(&testproc)).to eq([])
      end
    end


  end
end